// lib/presentation/widgets/mandor_picker_section.dart
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_bloc.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_event.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_state.dart';
import 'package:epms_tech/presentation/widgets/dropdown_search_row.dart';
import 'package:epms_tech/presentation/widgets/modal_bottom_sheet_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandorPickerSection extends StatelessWidget {
  // Global Complex Widget
  // Controller dan method harus dari masing2 parent
  final List<UserAssignment> mandorList;
  final List<String?> mandorPickerList;// // handle di file ini via BLoC

  const MandorPickerSection({
    super.key,
    required this.mandorList,
    required this.mandorPickerList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMandorBloc, AddMandorState>(
      listener:
          (context, state) => {
            if (state is ShowMandorSearchModal)
              {
              },
          },
      builder: (context, state) {
        return Column(
          children: [
            ...List.generate(mandorPickerList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownSearchRow(
                        key: ValueKey(
                          index.toString() + (mandorPickerList[index] ?? ""),
                        ),
                        items:
                            mandorList
                                .map((e) => e.mandorEmployeeName)
                                .toList(),
                        value: mandorPickerList[index],
                        onChanged: (value) {
                          context.read<AddMandorBloc>().add(
                            UpdateMandorPicker(
                              index: index,
                              selectedName: value,
                            ),
                          );
                        },
                        showDelete: true,
                        onIconSearchClicked: () {
                          Navigator.pushNamed(
                            context,
                            'search_screen',
                            arguments: {
                              "index": index,
                              "title": "Mandor Name",
                              "initBLoC": "add_mandor"
                            },
                          );
                        },
                        onDelete: () {
                          context.read<AddMandorBloc>().add(
                            DeleteMandorSelected(index: index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

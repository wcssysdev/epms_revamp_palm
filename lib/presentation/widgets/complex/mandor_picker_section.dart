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
  final List<UserAssignment> mandorList;
  final List<String?> mandorPickerList;
  final TextEditingController nameController;// handle di file ini via BLoC
  final ValueChanged<String> onChanged;// // handle di file ini via BLoC

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
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    child: ModalBottomSheetSection(
                        index: state.index,
                        bottomSheetTitle: 'Search Mandor Name',
                        placeholderTitle: 'Enter the Mandor name',
                        inputTextController: nameController,
                        onChanged: ,
                      ),
                  )
                ),
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
                          context.read<AddMandorBloc>().add(
                            IconSearchClicked(index: index),
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

/*
class ModalBottomSheetSection extends StatelessWidget {
  final int index;
  final String bottomSheetTitle;
  final String placeholderTitle;
  final TextEditingController inputTextController;
  final ValueChanged<String> onChanged;

  const ModalBottomSheetSection({
    super.key,
    required this.index,
    required this.bottomSheetTitle,
    required this.placeholderTitle,
    required this.inputTextController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(title: Text(bottomSheetTitle)),
          TextField(
            controller: inputTextController,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              icon: const Icon(Icons.supervised_user_circle),
              labelText: placeholderTitle,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save and close'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}


class MandorPickerSection extends StatelessWidget {
  final List<UserAssignment> mandorList;
  final List<String?> mandorPickerList;
  final TextEditingController nameController;
  final ValueChanged<String> onChanged;

  const MandorPickerSection({
    super.key,
    required this.mandorList,
    required this.mandorPickerList,
    required this.nameController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMandorBloc, AddMandorState>(
      listener: (context, state) {
        if (state is ShowMandorSearchModal) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => ModalBottomSheetSection(
              index: state.index,
              bottomSheetTitle: 'Search Mandor Name',
              placeholderTitle: 'Enter the Mandor name',
              inputTextController: nameController,
              onChanged: onChanged,
            ),
          );
        }
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
                        items: mandorList
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
                          context.read<AddMandorBloc>().add(
                                IconSearchClicked(index: index),
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


MandorPickerSection(
  mandorList: mandorList,
  mandorPickerList: mandorPickerList,
  nameController: TextEditingController(),
  onChanged: (value) {
    context.read<AddMandorBloc>().add(SearchMandorByName(query: value));
  },
),

 */
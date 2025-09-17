// lib/presentation/widgets/mandor_picker_section.dart
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:epms_tech/presentation/widgets/dropdown_search_row.dart';
import 'package:flutter/material.dart';

class MandorPickerSection extends StatelessWidget {
  final List<UserAssignment> mandorList;
  final List<String?> mandorPickerList;
  final Function(int index, String? value) onChanged;

  const MandorPickerSection({
    super.key,
    required this.mandorList,
    required this.mandorPickerList,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                        .map((e) {
                          return e.mandorEmployeeName;
                        })
                        .toList(),
                    value: mandorPickerList[index],
                    onChanged:(value) => onChanged(index, value),
                    onSearch: () {},
                    onDelete: () {},
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

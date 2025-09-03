import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CheckboxSection extends StatefulWidget {
  final String label;
  final bool? isChecked;
  final ValueChanged<bool>? onChanged;

  const CheckboxSection({
    required this.label,
    required this.isChecked,
    this.onChanged,
    super.key,
  });

  @override
  State<CheckboxSection> createState() => _CheckboxSectionState();
}

class _CheckboxSectionState extends State<CheckboxSection> {
  late bool localChecked;

  @override
  void initState() {
    super.initState();
    localChecked = widget.isChecked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label),
        Checkbox(
          activeColor: AppColors.primary,
          value: localChecked,
          onChanged: (bool? value) {
            setState(() {
              localChecked = value ?? false;
            });
            if (widget.onChanged != null && value != null) {
              widget.onChanged!(value);// ! artinya null safety or not null
            }
          },
        ),
      ],
    );
  }
}

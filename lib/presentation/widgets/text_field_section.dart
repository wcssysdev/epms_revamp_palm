import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldSection extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const TextFieldSection({
    super.key,
    this.label,
    required this.controller,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.textRegular),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 2)
        ),
      ),
    );
  }
}
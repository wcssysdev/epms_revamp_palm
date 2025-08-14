import 'package:flutter/material.dart';

class TextInputSection extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const TextInputSection({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
      ),
    );
  }
}
import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextPressableSection extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;

  const TextPressableSection({
    super.key,
    required this.label,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 18, color: AppColors.primary, fontWeight: FontWeight.bold)
      ),
    );
  }
}
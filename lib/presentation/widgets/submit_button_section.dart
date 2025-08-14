import 'package:epms_tech/core/theme/app_button_styles.dart';
import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SubmitButtonSection extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SubmitButtonSection({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppButtonStyles.submitButtonContainer,
      child: SizedBox(
        width: double.infinity, // full width
        child: ElevatedButton(
          style: AppButtonStyles.submitButtonStyle,
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(fontSize: 18, color: AppColors.textSubmitButton),
          ),
        ),
      ),
    );
  }
}

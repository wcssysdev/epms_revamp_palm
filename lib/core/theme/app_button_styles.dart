import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {
  static final BorderRadius defaultRadius = BorderRadius.circular(8);

  static final BoxDecoration submitButtonContainer = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 8,
        offset: const Offset(0, 4)
      )
    ],
    borderRadius: defaultRadius,
  );

  static final ButtonStyle submitButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: defaultRadius),
    elevation: 0, // bayangan pakai boxShadow
  );
}
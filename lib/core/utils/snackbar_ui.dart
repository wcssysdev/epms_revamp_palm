import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: AppColors.red,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: AppColors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
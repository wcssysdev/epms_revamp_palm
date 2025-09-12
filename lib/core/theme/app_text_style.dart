import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle screenTitle = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTitle,
  );

  static final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color.fromARGB(255, 23, 23, 23),
  );

  static final TextStyle body = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

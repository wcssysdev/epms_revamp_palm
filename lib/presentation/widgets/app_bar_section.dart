import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget{
  final String lable;
  final List<Widget>? actions;
  final bool centerTitle;

  const AppBarSection({
    super.key,
    required this.lable,
    this.actions,
    this.centerTitle = false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(
        color: AppColors.white
      ),
      title: Text(
        lable,
        style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // set default tinggi app bar
}
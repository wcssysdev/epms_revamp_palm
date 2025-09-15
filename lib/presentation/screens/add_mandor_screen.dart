// import 'package:flutter/cupertino.dart';
import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:epms_tech/core/theme/app_text_style.dart';
import 'package:epms_tech/presentation/widgets/logo_section.dart';
import 'package:epms_tech/presentation/widgets/outline_icon_button.dart';
import 'package:flutter/material.dart';

class AddMandorScreen extends StatefulWidget {
  const AddMandorScreen({super.key});

  @override
  State<AddMandorScreen> createState() => _AddMandorScreenState();
}

class _AddMandorScreenState extends State<AddMandorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoSection(),
              SizedBox(height: 16),
              Text('Mandor Setup', style: AppTextStyles.screenTitle),
              SizedBox(height: 18),
              OutlineIconButton(
                icon: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                label: "Add Mandor",
                onPressed: () {},
                borderColor: AppColors.primary,
                outlineHeight: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

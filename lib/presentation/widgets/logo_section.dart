import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/epms_logo.png',
      width: MediaQuery.of(context).size.width * 0.7,
      height: 120,
    );
  }
}

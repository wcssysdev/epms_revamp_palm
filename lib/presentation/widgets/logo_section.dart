import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/mhp_icon.png',
      width: MediaQuery.of(context).size.width * 0.7,
      height: 120,
    );
  }
}

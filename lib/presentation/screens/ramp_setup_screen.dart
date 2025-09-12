// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RampSetupScreen extends StatefulWidget {
  const RampSetupScreen({super.key});

  @override
  State<RampSetupScreen> createState() => _RampSetupScreenState();
}

class _RampSetupScreenState extends State<RampSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ramp Setup")),
      body: Center(child: Text('Ramp Setup')),
    );
  }
}

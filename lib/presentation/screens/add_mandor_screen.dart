// import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(title: const Text("Add Mandor")),
      body: Center(child: Text('Add Mandor')),
    );
  }
}

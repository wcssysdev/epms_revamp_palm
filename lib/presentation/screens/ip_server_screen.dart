import 'package:epms_tech/presentation/widgets/app_bar_section.dart';
import 'package:flutter/material.dart';

class IpServerScreen extends StatefulWidget{
  const IpServerScreen({super.key});

  @override
  State<IpServerScreen> createState() => _IpServerScreenState();
}

class _IpServerScreenState extends State<IpServerScreen> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSection(lable: 'Ip Server'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Text('ip text'),
            ]),
        ),
      ),
    );
  }
}
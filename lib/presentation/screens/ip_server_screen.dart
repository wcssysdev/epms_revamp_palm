import 'package:epms_tech/core/utils/hive_helper.dart';
import 'package:epms_tech/presentation/widgets/app_bar_section.dart';
import 'package:epms_tech/presentation/widgets/submit_button_section.dart';
import 'package:epms_tech/presentation/widgets/text_field_section.dart';
import 'package:flutter/material.dart';

class IpServerScreen extends StatefulWidget {
  IpServerScreen({super.key});

  @override
  State<IpServerScreen> createState() => _IpServerScreenState();
}
class _IpServerScreenState extends State<IpServerScreen> {
  final TextEditingController ipController = TextEditingController(text: 'http://10.7.129.108/epms_bia/api/v1_1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(lable: "Ip Server Setup"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter IP Server Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFieldSection( 
              controller: ipController, 
              onChanged: (value) {
                setState((){
                  ipController.text = value;
                });
              },
            ),
            SizedBox(height: 32),
            SubmitButtonSection(
              label: "SAVE",
              onPressed: () {
                final ipAddress = ipController.text.trim();
                onHivePut('ip_address', ipAddress)
                .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('IP Address saved: $ipAddress')),
                  );
                });
              },
            ),
          ]
        )
      )
    );
  }
}
import 'package:epms_tech/presentation/blocs/auth/auth_bloc.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_event.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';
import 'package:epms_tech/presentation/widgets/app_bar_section.dart';
import 'package:epms_tech/presentation/widgets/submit_button_section.dart';
import 'package:epms_tech/presentation/widgets/text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IpServerScreen extends StatefulWidget {
  const IpServerScreen({super.key});

  @override
  State<IpServerScreen> createState() => _IpServerScreenState();
}

class _IpServerScreenState extends State<IpServerScreen> {
  late TextEditingController ipController;
  String currentIp = '';

  @override
  void initState() {
    super.initState();
    final ipAddress = context.read<AuthBloc>().state.ipAddress;
    ipController = TextEditingController(text: ipAddress);
  }

  @override
  void dispose() {
    ipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(lable: "Ip Server Setup"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthIpSavedSuccess) {
                  Navigator.pop(context);
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.message}')),
                  );
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        'Enter IP Server Address:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFieldSection(
                        controller:
                            ipController, // otomatis update setelah user selesai input JANGAN HAPUS
                        onChanged:(_) {}, // tidak perlu diisi - DONE HANDLED automatically in controller
                      ),
                      SizedBox(height: 32),
                      SubmitButtonSection(
                        label: 'SAVE',
                        onPressed: () {
                          final ipAddress = ipController.text.trim();
                          context.read<AuthBloc>().add(
                            SaveIpAddressEvent(ipAddress: ipAddress),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

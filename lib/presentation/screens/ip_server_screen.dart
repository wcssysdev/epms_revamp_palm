import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:epms_tech/presentation/blocs/ip_server/ip_server_bloc.dart';
import 'package:epms_tech/presentation/blocs/ip_server/ip_server_state.dart';
import 'package:epms_tech/presentation/widgets/app_bar_section.dart';
import 'package:epms_tech/presentation/widgets/dropdown_picker_section.dart';
import 'package:epms_tech/presentation/widgets/logo_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: const AppBarSection(lable: 'Ip Setup'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
              SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: LogoSection(),
              ),
              SizedBox(height: 32),
              BlocBuilder<IpServerBloc, IpServerState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      // DropdownPickerSection(label: 'Change the Ip Server', selectedIp: selectedIp, data: data, onChanged: onChanged)
                    ],
                  );
                })
            ]),
        ),
      ),
    );
  }
}
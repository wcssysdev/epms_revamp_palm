import 'package:epms_tech/presentation/blocs/auth/auth_bloc.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_event.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';
import 'package:epms_tech/presentation/widgets/logo_section.dart';
import 'package:epms_tech/presentation/widgets/submit_button_section.dart';
import 'package:epms_tech/presentation/widgets/text_field_section.dart';
import 'package:epms_tech/presentation/widgets/text_pressable_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoSection(),
                SizedBox(height: 64),
                BlocBuilder<AuthBloc, AuthState>(
                  // <BlocType, BlocState>
                  // BLocBuilder = widget dari flutter_bloc
                  // listen akan State dan akan update UI
                  // AuthBLoc = tipe BLoC yang akan di listen
                  // AuthState = tipe state yang di hasilkan
                  builder: (context, state) {
                    // menerima context dan state terbaru dan
                    // update UI
                    // AuthBloc updated --> builder kepanggil
                    if (state is AuthLoading) {
                      return CircularProgressIndicator();
                    } 
                    
                    return Column(
                      children: [
                        TextFieldSection(
                          label: 'Username',
                          controller: usernameController,
                          onChanged: (value) {
                            // callback function -> tiap user ketik akan call ini
                            context.read<AuthBloc>().add(
                              // mengambil instance BLoC (AuthBloc)
                              // .add() = method di BLoC untuk kirim event ke BLoC
                              UsernameChanged(value),
                              // nama event
                            );
                          },
                          obscureText: false,
                        ),
                        const SizedBox(height: 32),
                        TextFieldSection(
                          label: 'Password',
                          controller: passwordController,
                          onChanged: (value) {
                            context.read<AuthBloc>().add(
                              PasswordChanged(value),
                            );
                          },
                          obscureText: true,
                        ),
                        const SizedBox(height: 32),
                        SubmitButtonSection(
                          label: "LOGIN",
                          onPressed: () {
                            final username = usernameController.text.trim();
                            final password = passwordController.text.trim();
                            context.read<AuthBloc>().add(
                              LoginRequestedEvent(
                                username: username, 
                                password: password, 
                                ipAddress: state.ipAddress
                              )
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        TextPressableSection(
                          label: 'Ip Server Setup', 
                          onPressed: () {
                            Navigator.pushNamed(context, 'ip_server');
                          }
                        ),
                        const SizedBox(height: 16),
                        TextPressableSection(
                          label: 'Cek cek', 
                          onPressed: () {
                            print('ip == ${state.ipAddress}');
                          }
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

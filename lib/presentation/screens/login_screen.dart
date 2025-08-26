import 'package:epms_tech/presentation/blocs/auth/auth_bloc.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_event.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';
import 'package:epms_tech/presentation/widgets/logo_section.dart';
import 'package:epms_tech/presentation/widgets/submit_button_section.dart';
import 'package:epms_tech/presentation/widgets/text_input_section.dart';
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
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 64),
              LogoSection(),
              SizedBox(height: 32),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  // menerima context dan state terbaru dan
                  // update UI
                  // AuthBloc updated --> builder kepanggil
                  if (state is AuthLoading) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      TextInputSection(
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
                      TextInputSection(
                        label: 'Password',
                        controller: passwordController,
                        onChanged: (value) {
                          context.read<AuthBloc>().add(PasswordChanged(value));
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
                            LoginRequested(// auth_event.dart
                              username: username,
                              password: password,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      TextPressableSection(
                        label: 'Ip Server Setup', onPressed: () {
                        Navigator.pushNamed(context, 'ip_server');
                      })
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

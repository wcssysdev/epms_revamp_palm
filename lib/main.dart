import 'package:epms_tech/data/auth_repository_impl.dart';
import 'package:epms_tech/domain/usecases/login_usecase.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_bloc.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';
import 'package:epms_tech/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final authRepository = AuthRepositoryImpl(
    baseUrl: 'http://10.7.129.108/epms_bia/api/v1_1/auth/login',
  );
  final loginUsecase = LoginUsecase(authRepository);

  runApp(
    BlocProvider(
      create: (_) => AuthBloc(loginUsecase), 
      child: const MyApp(),
      ), 
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocBuilder<AuthBloc, AuthState> (
        /*
        AuthBloc = Bloc dipakai untuk atur login/logout
        AuthState = State menggambarkan kondisi login saat ini
          AuthInitial
          AuthLoading
          Authenticated
          Unauthenticated

        ringkasan:
        AuthBloc = mengelola state terkait authentikasi
          menerima event (AuthEvent)
          poses logic (cek token, login/logout, update mis username)
          mengeluarkan state (AuthState) terbaru
        AuthState = representasi state (current state dan updated state)
        BlocBuilder<AuthBloc, AuthState> = widget yg build UI otomatis saat state di AuthBloc berubah
         */ 

        builder: (context, state) {
          if (state is Authenticated) {
            return const LoginScreen();//HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
        ),
    );

  }
}

/*
pelajarin
lib/
  ├── core/                # Konstanta, utils, theme, dll
          └── theme/
                ├── app_button_styles.dart
                ├── app_colors.dart
  ├── data/                # Data source, API, model, repository impl
          └── repository/
                ├── auth_repository_impl.dart
  ├── domain/              # Entity, abstract repository, use case
  |       └── repository/
                ├── auth_repository.dart
          └── usecases/
                ├── login_usecase.dart
  └── presentation/
      ├── blocs/           # State management (BLoC/Cubit)
      │    └── auth/
      │         ├── auth_bloc.dart
      │         ├── auth_event.dart
      │         └── auth_state.dart
      ├── screens/         # Semua UI screen
      └── widgets/         # Reusable widget
 */
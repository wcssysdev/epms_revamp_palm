import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// repository & impl
import 'package:epms_tech/data/repository/auth_repository_impl.dart';
import 'package:epms_tech/data/repository/auth_repository.dart';

// usecase
import 'package:epms_tech/domain/usecases/login_usecase.dart';

// bloc
import 'package:epms_tech/presentation/blocs/auth/auth_bloc.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';

// screen
import 'package:epms_tech/presentation/screens/ip_server_screen.dart';
import 'package:epms_tech/presentation/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('app_settings');

  final authRepository = AuthRepositoryImpl(baseUrl: 'http://222.7.129.108/epms_bia/api/v1_1' );// wajib di define 
  final loginUsecase = LoginUsecase(authRepository);
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(loginUsecase, authRepository),
          ),
        ],
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
        builder: (context, state) {
          if (state is Authenticated) {
            return const IpServerScreen(); //HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
        ),
        routes: {
        'ip_server': (context) => IpServerScreen(),
      },
    );

  }
}

/*
CODE UI -> handle Input data User, dan trigger event ke BLoC
CODE BLoC -> logic, validasi, simpan data ke Hive/API/Repository, emit state baru
CODE Repository / data source -> detail proses akses API, database, dll

lib/
  ├── core/                # Konstanta, utils, theme, dll
          └── constants/
                └── app_constants.dart
          └── theme/
                ├── app_button_styles.dart
                ├── app_colors.dart
          └── utils/
                ├── json_parser.dart
  ├── data/                # Data source, API, model, repository impl
          └── repository/
                ├── auth_repository_impl.dart
                ├── auth_repository.dart
  ├── domain/
          └── usecases/
                ├── login_usecase.dart
  └── presentation/
      ├── blocs/           # State management (BLoC/Cubit)
      │    └── auth/
      │         ├── auth_bloc.dart
      │         ├── auth_event.dart
      │         └── auth_state.dart
      ├── screens/         # Semua UI screen
          └── login_screen.dart
      └── widgets/         # Reusable widget
          └── logo_section.dart
          └── submit_button_section.dart
          └── text_input_section.dart

 */

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


/*
parsing JSON pakai compute() lalu simpan ke Hive.
Alurnya :
LoginUseCase → panggil AuthRepository.
AuthRepositoryImpl → request API login, ambil JSON besar, parsing di compute().
AuthRepositoryImpl → simpan hasil parsing ke Hive.
AuthBloc → ubah state ke Authenticated kalau berhasil.
UI → ambil data dari Hive untuk ditampilkan.
*/
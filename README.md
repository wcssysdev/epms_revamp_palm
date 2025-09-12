run build runner
untuk run pertama 
--> flutter packages pub run build_runner build

untuk update existin
--> flutter pub run build_runner watch


abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String userId;
  final String userRole;

  Authenticated({required this.userId, required this.userRole});
}

class Unauthenticated extends AuthState {
  final String? message;

  Unauthenticated({this.message});
}
========================
auth bloc 
on<LoginEvent>((event, emit) async {
  emit(AuthLoading());
  try {
    final user = await loginUseCase(event.username, event.password);
    emit(Authenticated(userId: user.id, userRole: user.role));
  } catch (e) {
    emit(Unauthenticated(message: e.toString()));
  }
});
=================================

main.dart

home: BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if (state is Authenticated) {
      switch (state.userRole) {
        case 'harvester':
          return AddMandorScreen();
        case 'transporter':
          return RampSetupScreen();
        default:
          return MainScreen();
      }
    } else {
      return const LoginScreen();
    }
  },
),
==========================
tiap screen sat klik SAVE
ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => NextScreen()),
    );
  },
  child: Text("SAVE"),
);
 ==========================
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];// Object bersifat opsional
}

class AppStarted extends AuthEvent{} // props = [] OK

class LoggedIn extends AuthEvent{
  final String token;
  final String username;
  LoggedIn({required this.token, required this.username});

  @override
  List<Object?> get props => [token, username];
}

class LoggedOut extends AuthEvent{}

class UsernameChanged extends AuthEvent {
  final String username;
  UsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

class PasswordChanged extends AuthEvent{
  final String password;
  PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  LoginRequested({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
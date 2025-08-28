import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];// Object bersifat opsional
}

class AppStarted extends AuthEvent{} // props = [] OK

class LoggedIn extends AuthEvent{
  final String username;
  final String password;

  LoggedIn({required this.password, required this.username});
  @override
  List<Object?> get props => [username, password];
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

class LoginRequestedEvent extends AuthEvent {
  final String username;
  final String password;
  final String ipAddress;

  LoginRequestedEvent({
    required this.username,
    required this.password,
    required this.ipAddress
  });

  @override
  List<Object?> get props => [username, password];
}

class SaveIpAddressEvent extends AuthEvent  {
  final String ipAddress;
  SaveIpAddressEvent({required this.ipAddress});

  @override
  List<Object?> get props => [ipAddress];
}
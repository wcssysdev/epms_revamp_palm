// abstract class AuthState {}

// class AuthInitial extends AuthState{}
// class AuthLoading extends AuthState{}
// class Authenticated extends AuthState{}
// class Unauthenticated extends AuthState{}

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
class AuthFailure extends AuthState{
  final String message;
  AuthFailure({required this.message});// constructor

  @override
  List<Object?> get props => [message];
}
class Authenticated extends AuthState{
  final String username;
  final String password;

  Authenticated({required this.username, required this.password}); // CONSTRUCTOR
  // fungsi ini saat pertama kali dipanggil akan ngecek 2 parameter (mis saat buat state baru Authenticated)
  Authenticated copyWith({String? username, String? password}) {
    // WAJIB DI DEFINE untuk ubah field username dan password diatas
    // copyWith = menerima parameter dan akan menggantikan value dari variable username
    /*
    final auth1 = Authenticated(username: 'AuthA');
    final auth2 = auth1.copyWith(username: 'AuthB');
    final auth3 = auth1.copyWith();

    auth1.username = 'AuthA'
    auth2.username = 'AuthB'
    auth3.username = 'AuthA'
     */
    return Authenticated(username: username ?? this.username, password: password ?? this.password);
  }

  @override
  List<Object?> get props => [username];
}
class Unauthenticated extends AuthState{}
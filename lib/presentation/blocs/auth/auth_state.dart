import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final String ipAddress;
  final String userRole;
  final bool fdnWithoutCp;

  const AuthState({
    this.userRole = '',
    this.ipAddress = 'http://333.7.129.108/epms_bia/api/v1_1',
    this.fdnWithoutCp = true,
  });
  // di set di parent AuthState agar semua state child bisa consume
  // harus di pilih child class yg bisa melakukan perubahan ipAddress; {super.ipAddress} <-- syarat tuk ubah ipAddress pada child class

  @override
  List<Object?> get props => [ipAddress, userRole];
  // [ipAddress] akan dipakai sebagai pembanding dengan child yang consume (get dan update) ip address, dan akan ubah/trigger UI bila ada perubahan
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure({required this.message, super.ipAddress, super.fdnWithoutCp});
  // CASE GAGAL TETAP UPDATE IP - DON'T DELETE
  
  @override
  List<Object?> get props => [message, ipAddress, fdnWithoutCp];
}

class Authenticated extends AuthState {
  final String username;
  final String password;

  const Authenticated({
    required this.username,
    required this.password,
    super.ipAddress,
    super.fdnWithoutCp,
    super.userRole,
  });

  Authenticated copyWith({String? username, String? password, String? ipAddress, bool? fdnWithoutCp, String? userRole}) {
    return Authenticated(
      username: username ?? this.username,
      password: password ?? this.password,
      ipAddress: ipAddress ?? this.ipAddress,
      fdnWithoutCp: fdnWithoutCp ?? this.fdnWithoutCp, // biar gak ke reset
      userRole: userRole ?? this.userRole, // perlu cek User Role
    );
  }

  @override
  List<Object?> get props => [username, password, ipAddress, fdnWithoutCp, userRole];
}

class Unauthenticated extends AuthState {
  const Unauthenticated({super.ipAddress, super.fdnWithoutCp});

  Unauthenticated copyWith({String? ipAddress, bool? fdnWithoutCp}) {
    return Unauthenticated(
      ipAddress: ipAddress ?? this.ipAddress,
      fdnWithoutCp: fdnWithoutCp ?? this.fdnWithoutCp,
    );
  }
  // @override
  // List<Object?> get props => [ipAddress];
}

class AuthIpSavedSuccess extends AuthState {
    // const AuthIpSavedSuccess({required String ipAddress}) : super(ipAddress : ipAddress);// JANGAN DI HAPUS
  const AuthIpSavedSuccess({required super.ipAddress, required super.fdnWithoutCp});// bentuk shorthand untuk update parent class
}

/*
CATATAN
copyWith = menerima parameter dan akan menggantikan value dari variable username

  final auth1 = Authenticated(username: 'AuthA');
  final auth2 = auth1.copyWith(username: 'AuthB');
  final auth3 = auth1.copyWith();

  auth1.username = 'AuthA'
  auth2.username = 'AuthB'
  auth3.username = 'AuthA'

 */
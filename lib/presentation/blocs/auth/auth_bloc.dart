import 'dart:math';

import 'package:epms_tech/presentation/blocs/auth/auth_event.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //   /*
  //   AuthEvent = berisi event yang akan di kirim ke AuthBloc
  //     AppStarted
  //     LoggedIn
  //     LoggedOut
  //   AuthState = state dari status authentikasi
  //     AuthInitial
  //     AuthLoading
  //     Authenticated
  //     Unauthenticated
  //    */
  AuthBloc() : super(AuthInitial()) {
    // AuthInitial -> state awal saat UI Bloc tampil
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());
      final prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if(isLoggedIn) {
        String username = prefs.getString('username') ?? '';
        String password = prefs.getString('password') ?? '';
        emit(Authenticated(username: username, password: password));
      } else {
        emit(Unauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      if(event is LoggedIn) { // is setara dengan ==
        await prefs.setString('username', event.username);
        emit(Authenticated(username: event.username, password: event.username));
      } else {
        emit(Authenticated(username: '', password: ''));
      }
    });

    on<LoggedOut>((event, emit)async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('username');
      emit(Unauthenticated());
    });

    on<UsernameChanged>((event, emit) {
      if (state is Authenticated) {
        final currentState = state as Authenticated;
        print(event.username);
        emit(currentState.copyWith(username: event.username));
      } else {
        print('belum ter authentikasi ==');
      }
    });

    on<PasswordChanged>((event, emit) {
      if (state is Authenticated) {
        final currentState = state as Authenticated;
        print('== ${event.password}');
        emit(currentState.copyWith(password: event.password));
      }
    });

  on<LoginRequested>((event, emit) async {
    emit(AuthLoading());
    try {
      final isSuccess = await authRepository.login(event.username, event.password);

      if(isSuccess) {
        add(LoggedIn(token: 'dumyToken', username: event.username));
      } else {
        emit(AuthFailure(message: 'Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  });
  }
}

/*
FINAL ALUR KERJA SEDERHANA
1. Applikasi di buka -> kirim event AppStarted
2. Bloc baca status login dari SharedPreferences
3. Sudah login - state jadi Authenticated -> misal belum -> Unauthenticated
4. Saat login berhasil -> kirim event LoggedIn -> langsung Authenticated
5. Saat logout => kirim event LoggedOut -> langsung Unauthenticated

 */
import 'package:epms_tech/data/repository/auth_repository_impl.dart';
import 'package:epms_tech/data/repository/auth_repository.dart';
import 'package:epms_tech/domain/usecases/login_usecase.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_event.dart';
import 'package:epms_tech/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final AuthRepository authRepository; // tambahkan di AuthBloc constructor di bawah JANGAN DI HAPUS

  AuthBloc(this.loginUsecase, this.authRepository) : super(AuthInitial()) {
    // AuthBloc(this.loginUsecase) = nerima objec loginUsecase dan simpan di property class
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginRequestedEvent>(_onLoginRequested);
    on<SaveIpAddressEvent>(_onSaveIpAddress);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    // AppStarted = saat applikasi pertama kali dibuka dan langsun jalanin ini 
    // termasuk cek token di storage 
    // Emitter = alat flutter_bloc tuk kirim state baru
    // emit = alat tuk ubah state di BLoC

    emit(AuthLoading());
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if(isLoggedIn) {
      String username = prefs.getString('username') ?? '';
      String password = prefs.getString('password') ?? '';
      emit(Authenticated(username: username, password: password));// dari AuthState
    } else {
      emit(Unauthenticated());// dari AuthState
    }
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    // LoggedIn = nama event
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', event.username);
    emit(Authenticated(username: event.username, password: event.password));
  }

  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('username');
    emit(Unauthenticated());
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<AuthState> emit) {
    if(state is Authenticated) {
      final currentState = state as Authenticated;
      // harus di define dengan Authenticated karena pada AuthState untuk username di set pada Authenticated
      emit(currentState.copyWith(username: event.username));
    }
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    if(state is Authenticated) {
      final currentState = state as Authenticated;
      emit(currentState.copyWith(password: event.password));
    }
  }

  Future<void> _onLoginRequested(LoginRequestedEvent event, Emitter<AuthState>emit) async {
    emit(AuthLoading());
    try {
      final isSuccess = await loginUsecase.execute(
        event.username,
        event.password,
        ipAddress: event.ipAddress
      );
      if (isSuccess) {
        emit(Authenticated(username: event.username, password: event.password));
      } else {
        emit(AuthFailure(message: 'Invalid credentials', ipAddress: event.ipAddress));// untuk tetap update IP super state class JANGAN HAPUS
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString(), ipAddress: event.ipAddress));// untuk tetap update IP super state class JANGAN HAPUS
    }
  }

  Future<void> _onSaveIpAddress(SaveIpAddressEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await authRepository.saveIpAddress(event.ipAddress); // simpan ip address lewat repository -> HIVE JANGAN DI HAPUS
      emit(AuthIpSavedSuccess(ipAddress:  event.ipAddress));
    } catch (e) {
      emit(AuthFailure(message: 'Failed to save IP Address: $e'));
      return;
    }
    
  } 
}

    /*
    AuthEvent = berisi event yang akan di kirim ke AuthBloc
      AppStarted
      LoggedIn
      LoggedOut
    AuthState = state dari status authentikasi
      AuthInitial
      AuthLoading
      Authenticated
      Unauthenticated
     */

    /*
    1. CEK AUTH STATE
    tuk ip address


    
     */
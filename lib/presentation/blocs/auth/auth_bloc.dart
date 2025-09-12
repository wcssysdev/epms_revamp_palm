import 'package:epms_tech/data/datasources/auth_local_datasource.dart';
import 'package:epms_tech/domain/repositories/auth_repository.dart';
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
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginRequestedEvent>(_onLoginRequested);
    on<SaveIpAddressEvent>(_onSaveIpAddress);
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
      final result = await loginUsecase.execute(
        event.username,
        event.password,
        ipAddress: event.ipAddress
      );
      if (result.isSuccess) {
        emit(Authenticated(username: event.username, password: event.password, ipAddress: event.ipAddress, userRole: result.userRole ));// update user role
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
      await authRepository.saveIpAddress(event.ipAddress, event.fdnWithoutCp); // simpan ip address lewat repository -> HIVE JANGAN DI HAPUS
      emit(AuthIpSavedSuccess(ipAddress:  event.ipAddress, fdnWithoutCp: event.fdnWithoutCp)); // emit state baru
    } catch (e) {
      emit(AuthFailure(message: 'Failed to save IP Address: $e'));
      return;
    }
    
  } 

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    // AppStarted bawaan dari BLoC event
    // AppStarted = saat applikasi pertama kali dibuka dan langsun jalanin ini 
    // termasuk cek token di storage 
    // Emitter = alat flutter_bloc tuk kirim state baru
    // emit = alat tuk ubah state di BLoC
    final localDataSource = AuthLocalDatasource();

    emit(AuthLoading());

    try {
      final savedIp = await authRepository.getIpAddress();
      final savedFdnWithoutCp = await authRepository.getFdnWithoutCp();

      final ipAddress = (savedIp != null && savedIp.trim().isNotEmpty)
        ? savedIp.trim()
        : state.ipAddress;
      final fdnWithoutCp = savedFdnWithoutCp ?? state.fdnWithoutCp; // null || boolean

      final prefs = await SharedPreferences.getInstance();
      final loginResult = await localDataSource.getUserRolesAuthed();
      if (loginResult.isSuccess) {
        final username = prefs.getString('username') ?? '';
        final password = prefs.getString('password') ?? '';

        emit(Authenticated(
          username: username, 
          password: password, 
          ipAddress: ipAddress,
          fdnWithoutCp: fdnWithoutCp,
          userRole: loginResult.userRole
        ));

      } else {
        emit(Unauthenticated(ipAddress: ipAddress, fdnWithoutCp: fdnWithoutCp));
      }
    } catch (e) {
      emit(AuthFailure(
        message: 'Error during app start: $e', 
        ipAddress: state.ipAddress,
        fdnWithoutCp: state.fdnWithoutCp
      ));
    }
  }
}

import 'package:epms_tech/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository; // di defenisikan ulang; domain/repository/auth_repository.dart
  LoginUsecase(this.repository); // usecase ini butuh parameter

  Future<bool> execute(String username, String password) async {
    if(username.isEmpty || password.isEmpty) {
      return false;
    }
    return repository.login(username, password);
  }
}
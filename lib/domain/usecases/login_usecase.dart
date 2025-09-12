import 'package:epms_tech/domain/entities/login_result.dart';
import 'package:epms_tech/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository; // di defenisikan ulang;
  LoginUsecase(this.repository); // usecase ini butuh parameter

  Future<LoginResult> execute(String username, String password, {String? ipAddress}) async {
    if(username.isEmpty || password.isEmpty) {
      return LoginResult(isSuccess: false, userRole: '');
    }
    return repository.login(username, password, ipAddress: ipAddress);
  }
}
import 'package:epms_tech/domain/entities/login_result.dart';

abstract class AuthRepository { // KONTRAK INTERFACE - JANGAN DI HAPUS
  Future<LoginResult> login(String username, String password, {String? ipAddress});
  Future<void> saveIpAddress(String ipAddress, bool fdnWithoutCp);
  Future<String?> getIpAddress();
  Future<bool?> getFdnWithoutCp();
}
abstract class AuthRepository { // KONTRAK INTERFACE - JANGAN DI HAPUS
  Future<bool> login(String username, String password, {String? ipAddress});
  Future<void> saveIpAddress(String ipAddress);
}
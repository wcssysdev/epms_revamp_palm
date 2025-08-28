abstract class AuthRepository { // KONTRAK INTERFACE - JANGAN DI HAPUS
  Future<bool> login(String username, String password);
  Future<void> saveIpAddress(String ipAddress);
}
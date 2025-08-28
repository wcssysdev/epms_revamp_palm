import 'package:epms_tech/core/utils/hive_helper.dart';
import 'package:epms_tech/data/datasources/auth_local_datasource.dart';
import 'package:epms_tech/data/datasources/auth_remote_datasource.dart';
import 'package:epms_tech/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{// IMPLEMENTASI KONTRAK INTERFACE - JANGAN DI HAPUS
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;
  final String baseUrl;

  AuthRepositoryImpl({ required this.baseUrl })
    :remoteDatasource = AuthRemoteDatasource(baseUrl: baseUrl),
    localDatasource = AuthLocalDatasource();

  @override
  Future<bool> login(String username, String password) async {
    AuthRemoteDatasource(baseUrl: baseUrl);

    final parsedData = await remoteDatasource.login(username, password);
    await localDatasource.saveSchemas(parsedData);

    return true;
  }

  @override
  Future<void> saveIpAddress(String ipAddress) async {
    await onHivePut("ip_address", ipAddress);// Helper Global
  }
}
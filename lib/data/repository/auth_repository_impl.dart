import 'package:epms_tech/core/utils/hive_helper.dart';
import 'package:epms_tech/data/datasources/auth_local_datasource.dart';
import 'package:epms_tech/data/datasources/auth_remote_datasource.dart';
import 'package:epms_tech/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{// IMPLEMENTASI KONTRAK INTERFACE - JANGAN DI HAPUS
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({ 
      required String baseUrl,
      AuthLocalDatasource? local,
    })
    :remoteDatasource = AuthRemoteDatasource(baseUrl: baseUrl),
    localDatasource = local ?? AuthLocalDatasource();

  @override
  Future<bool> login(String username, String password, {String? ipAddress}) async {
    final effectiveBaseUrl = ipAddress ?? remoteDatasource.baseUrl;
    final remote = AuthRemoteDatasource(baseUrl: effectiveBaseUrl);
    final parsedData = await remote.login(username, password);
    await localDatasource.saveSchemas(parsedData);

    return true;
  }

  @override
  Future<void> saveIpAddress(String ipAddress) => localDatasource.saveIpAddress(ipAddress); // Local Datasource

  @override
  Future<String?> getIpAddress() => localDatasource.getIpAddress();
}
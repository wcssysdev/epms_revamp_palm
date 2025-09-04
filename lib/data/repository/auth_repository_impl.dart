import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:epms_tech/data/datasources/auth_local_datasource.dart';
import 'package:epms_tech/data/datasources/auth_remote_datasource.dart';
import 'package:epms_tech/data/repository/master_data_repository_impl.dart';
import 'package:epms_tech/domain/repositories/auth_repository.dart';
import 'package:hive/hive.dart';

class AuthRepositoryImpl implements AuthRepository{// IMPLEMENTASI dari INTERFACE  - JANGAN DI HAPUS
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
    
    final masterDataGlobal = parsedData['global'];
    var box = await Hive.openBox('epms_data');
    final masterDataRepo = MasterDataRepositoryImpl(box: box);
    await masterDataRepo.saveHarvestMethods(masterDataGlobal[AppConstants.mHarvestingMethodSchema]);
    await masterDataRepo.saveEmployee(masterDataGlobal[AppConstants.mEmployeeSchema]);

    // await localDatasource.saveSchemas(parsedData);// CARA LAMA JANGAN DI HAPUS
    return true;
  }

  @override
  Future<void> saveIpAddress(String ipAddress, bool fdnWithoutCp) => localDatasource.saveIpAddress(ipAddress, fdnWithoutCp); // Local Datasource

  @override
  Future<String?> getIpAddress() => localDatasource.getIpAddress();

  @override
  Future<bool?> getFdnWithoutCp() => localDatasource.getFdnWithoutCp();
}
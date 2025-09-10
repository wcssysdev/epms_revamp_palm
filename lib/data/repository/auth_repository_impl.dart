import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:epms_tech/data/datasources/auth_local_datasource.dart';
import 'package:epms_tech/data/datasources/auth_remote_datasource.dart';
import 'package:epms_tech/domain/model/crop_type_model.dart';
import 'package:epms_tech/domain/model/employee_model.dart';
import 'package:epms_tech/domain/model/estate_model.dart';
import 'package:epms_tech/domain/model/harvesting_method_model.dart';
import 'package:epms_tech/domain/model/work_center_model.dart';
import 'package:epms_tech/domain/model/work_type_model.dart';
import 'package:epms_tech/domain/repositories/auth_repository.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  // IMPLEMENTASI dari INTERFACE  - JANGAN DI HAPUS
  // MAIN API RESPONDS - JANGAN HAPUS
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;
  final MasterDataRepository masterDataRepository;

  AuthRepositoryImpl({
    required String baseUrl,
    AuthLocalDatasource? local,
    required this.masterDataRepository,
  }) : remoteDatasource = AuthRemoteDatasource(baseUrl: baseUrl),
        localDatasource = local ?? AuthLocalDatasource();

  @override
  Future<bool> login(
    String username,
    String password, {
    String? ipAddress,
  }) async {
    final effectiveBaseUrl = ipAddress ?? remoteDatasource.baseUrl;
    final remote = AuthRemoteDatasource(baseUrl: effectiveBaseUrl);
    final parsedData = await remote.login(username, password);

    final masterDataGlobal = parsedData['global'];

    // penyimpanan menggunakan di - inject
    await masterDataRepository.saveHarvestMethods(
      (masterDataGlobal[AppConstants.mHarvestingMethodSchema] as List)
          .map((json) => HarvestingMethodModel.fromJson(json))
          .toList(),
    );

    await masterDataRepository.saveEmployee(
      (masterDataGlobal[AppConstants.mEmployeeSchema] as List)
          .map((json) => EmployeeModel.fromJson(json))
          .toList(),
    );

    await masterDataRepository.saveCropType(
      (masterDataGlobal[AppConstants.mCropTypeSchema] as List)
      .map((json) => CropTypeModel.fromJson(json))
      .toList(),
    );

    await masterDataRepository.saveWorkType(
      (masterDataGlobal[AppConstants.mWorkTypeSchema] as List)
      .map((json) => WorkTypeModel.fromJson(json))
      .toList(),
    );

    await masterDataRepository.saveWorkCenter(
      (masterDataGlobal[AppConstants.mWorkCenterSchema] as List)
      .map((json) => WorkCenterModel.fromJson(json))
      .toList(),
    );

    await masterDataRepository.saveEstate(
      (masterDataGlobal[AppConstants.mEstateSchema] as List)
      .map((json) => EstateModel.fromJson(json))
      .toList(),
    );

    return true;
  }

  @override
  Future<void> saveIpAddress(String ipAddress, bool fdnWithoutCp) =>
      localDatasource.saveIpAddress(ipAddress, fdnWithoutCp); // Local Datasource

  @override
  Future<String?> getIpAddress() => localDatasource.getIpAddress();

  @override
  Future<bool?> getFdnWithoutCp() => localDatasource.getFdnWithoutCp();
}

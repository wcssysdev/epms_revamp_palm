import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/entities/employee.dart';
import 'package:epms_tech/domain/entities/harvesting_method.dart';
import 'package:epms_tech/domain/entities/work_center.dart';
import 'package:epms_tech/domain/entities/work_type.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';
import 'package:hive/hive.dart';

class MasterDataRepositoryImpl implements MasterDataRepository {
  // implementasi Repository - model JANGAN HAPUS
  final Box box;

  MasterDataRepositoryImpl({required this.box});

  @override
  Future<void> saveHarvestMethods(
    List<HarvestingMethod> harvestingMethods,
  ) async {
    // List<Map<String, dynamic>>  = expected akan return List[{}]
    // Map<String, dynamic> = data Object dengan String key dan Dynamic value
    // [{key:value, key:value}] => List of Map

    final List<Map<String, dynamic>> dataToStore =
        harvestingMethods.map((method) {
          return {
            'mhm_id': method.mhmId,
            'mhm_indicator': method.mhmIndicator,
            'mhm_abbreviation': method.mhmAbbreviation,
            'mhm_description': method.mhmDescription,
          };
        }).toList();
    await box.put(AppConstants.mHarvestingMethodSchema, dataToStore);
  }

  @override
  Future<List<HarvestingMethod>> getHarvestMethods() async {
    final data = box.get(
      AppConstants.mHarvestingMethodSchema,
      defaultValue: [],
    );
    final harvestMethods = (data as List).cast<Map<String, dynamic>>();

    return harvestMethods
        .map(
          (item) => HarvestingMethod(
            // entities
            mhmId: item['mhm_id'],
            mhmIndicator: item['mhm_indicator'],
            mhmAbbreviation: item['mhm_abbreviation'],
            mhmDescription: item['mhm_description'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveEmployee(List<Employee> employee) async {
    // Employee dari Entities JANGAN HAPUS
    final List<Map<String, dynamic>> dataToStore =
        employee.map((item) {
          return {
            'employee_id': item.employeeId,
            'employee_code': item.employeeCode,
            'employee_name': item.employeeName,
            'employee_job_code': item.employeeJobCode,
            'employee_profile': item.employeeProfile,
            'employee_gang_allotment_code': item.employeeGangAllotmentCode,
          };
        }).toList();
    await box.put(AppConstants.mEmployeeSchema, dataToStore);
  }

  @override
  Future<List<Employee>> getEmployee() async {
    // Employee dari Entities JANGAN HAPUS
    final data = box.get(AppConstants.mEmployeeSchema, defaultValue: []);
    final employees = (data as List).cast<Map<String, dynamic>>();
    // harus di CAST agar tidak bersifat dynamic tapi bersifat Map -- JANGAN HAPUS

    return employees
        .map(
          (item) => Employee(
            // entities
            employeeId: item['employee_id'],
            employeeCode: item['employee_code'],
            employeeName: item['employee_name'],
            employeeJobCode: item['employee_job_code'],
            employeeProfile: item['employee_profile'],
            employeeGangAllotmentCode: item['employee_gang_allotment_code'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveCropType(List<CropType> cropType) async {
    final List<Map<String, dynamic>> dataToStore =
        cropType.map((item) {
          return {
            'croptypecode': item.cropTypeCode,
            "croptypename": item.cropTypeName,
            "description": item.description,
            "canharvest": item.canHarvest,
          };
        }).toList();
    await box.put(AppConstants.mCropTypeSchema, dataToStore);
  }

  @override
  Future<List<CropType>> getCropType() async {
    final data = box.get(AppConstants.mCropTypeSchema, defaultValue: []);
    final cropTypes = (data as List).cast<Map<String, dynamic>>();

    return cropTypes
        .map(
          (item) => CropType(
            cropTypeCode: item['croptypecode'] ?? '',
            cropTypeName: item['croptypename'] ?? '',
            description: item['description'] ?? '',
            canHarvest: item['canharvest'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveWorkType(List<WorkType> workTypes) async {
    final List<Map<String, dynamic>> dataToStore =
        workTypes.map((item) {
          return {
            'work_type_id': item.workTypeId,
            'work_type_code': item.workTypeCode,
            'work_type_name': item.workTypeName,
          };
        }).toList();
    await box.put(AppConstants.mWorkTypeSchema, dataToStore);
  }

  @override
  Future<List<WorkType>> getWorkType() async {
    final data = box.get(AppConstants.mWorkTypeSchema, defaultValue: []);
    final worktypes = (data as List).cast<Map<String, dynamic>>();

    return worktypes.map((item) {
      return WorkType(
        workTypeId: item['work_type_id'],
        workTypeCode: item['work_type_code'],
        workTypeName: item['work_type_name'],
      );
    }).toList();
  }

  @override
  Future<void> saveWorkCenter(List<WorkCenter> workCenter) async {
    final List<Map<String, dynamic>> dataToStore =
        workCenter.map((item) {
          return {
            "work_center_id": item.workCenterId,
            "work_center_code": item.workCenterCode,
            "work_center_name": item.workCenterName,
            "work_center_company_code": item.workCenterCompanyCode,
            "work_center_plant_code": item.workCenterPlantCode,
            "work_center_estate_code": item.workCenterEstateCode,
            "work_center_division_code": item.workCenterDivisionCode,
          };
        }).toList();
    await box.put(AppConstants.mWorkCenterSchema, dataToStore);
  }

  @override
  Future<List<WorkCenter>> getWorkCenter() async {
    final data = box.get(AppConstants.mWorkCenterSchema, defaultValue: []);
    final workCenter = (data as List).cast<Map<String, dynamic>>();

    return workCenter
        .map(
          (item) => WorkCenter(
            workCenterId: item['work_center_id'],
            workCenterCode: item['work_center_code'],
            workCenterName: item['work_center_name'],
            workCenterCompanyCode: item['work_center_company_code'],
            workCenterPlantCode: item['work_center_plant_code'],
            workCenterEstateCode: item['work_center_estate_code'],
            workCenterDivisionCode: item['work_center_division_code'],
          ),
        )
        .toList();
  }
}

import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:epms_tech/domain/entities/activity.dart';
import 'package:epms_tech/domain/entities/attendance.dart';
import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/entities/division.dart';
import 'package:epms_tech/domain/entities/employee.dart';
import 'package:epms_tech/domain/entities/estate.dart';
import 'package:epms_tech/domain/entities/harvesting_method.dart';
import 'package:epms_tech/domain/entities/master_block.dart';
import 'package:epms_tech/domain/entities/vendor.dart';
import 'package:epms_tech/domain/entities/vra.dart';
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

  @override
  Future<void> saveEstate(List<Estate> estates) async {
    final List<Map<String, dynamic>> dataToStore =
        estates.map((item) {
          return {
            'estate_id': item.estateId,
            'estate_company_code': item.estateCompanyCode,
            'estate_code': item.estateCode,
            'estate_name': item.estateName,
            'estate_plant_code': item.estatePlantCode,
          };
        }).toList();
    await box.put(AppConstants.mEstateSchema, dataToStore);
  }

  @override
  Future<List<Estate>> getEstate() async {
    final data = box.get(AppConstants.mEstateSchema, defaultValue: []);
    final estates = (data as List).cast<Map<String, dynamic>>();

    return estates
        .map(
          (item) => Estate(
            estateId: item['estate_id'],
            estateCompanyCode: item['estate_company_code'],
            estateCode: item['estate_code'],
            estateName: item['estate_name'],
            estatePlantCode: item['estate_plant_code'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveDivision(List<Division> divisions) async {
    final List<Map<String, dynamic>> dataToStore =
        divisions.map((item) {
          return {
            "division_id": item.divisionId,
            "division_company_code": item.divisionCompanyCode,
            "division_estate_code": item.divisionEstateCode,
            "division_code": item.divisionCode,
            "division_name": item.divisionName,
          };
        }).toList();
    await box.put(AppConstants.mDivisionSchema, dataToStore);
  }

  @override
  Future<List<Division>> getDivision() async {
    final data = box.get(AppConstants.mDivisionSchema, defaultValue: []);
    final divisions = (data as List).cast<Map<String, dynamic>>();

    return divisions
        .map(
          (item) => Division(
            divisionId: item['division_id'],
            divisionCompanyCode: item['division_company_code'],
            divisionEstateCode: item['division_estate_code'],
            divisionCode: item['division_code'],
            divisionName: item['division_name'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveMasterBlock(List<MasterBlock> blocks) async {
    final List<Map<String, dynamic>> dataToStore =
        blocks.map((item) {
          return {
            "block_id": item.blockId,
            "block_company_code": item.blockCompanyCode,
            "block_estate_code": item.blockEstateCode,
            "block_division_code": item.blockDivisionCode,
            "block_code": item.blockCode,
            "block_name": item.blockName,
            "block_hectarage": item.blockHectarage,
            "block_state": item.blockState,
            "block_crop_type": item.blockCropType,
          };
        }).toList();
    await box.put(AppConstants.mBlockSchema, dataToStore);
  }

  @override
  Future<List<MasterBlock>> getMasterBlock() async {
    final data = box.get(AppConstants.mBlockSchema, defaultValue: []);
    final blocks = (data as List).cast<Map<String, dynamic>>();
    return blocks
        .map(
          (item) => MasterBlock(
            blockId: item['block_id'],
            blockCompanyCode: item['block_company_code'],
            blockEstateCode: item['block_estate_code'],
            blockDivisionCode: item['block_division_code'],
            blockCode: item['block_code'],
            blockName: item['block_name'],
            blockHectarage: item['block_hectarage'],
            blockState: item['block_state'],
            blockCropType: item['block_crop_type'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveVendor(List<Vendor> vendors) async {
    final List<Map<String, dynamic>> dataToStore =
        vendors.map((item) {
          return {
            "vendor_id": item.vendorId,
            "vendor_code": item.vendorCode,
            "vendor_name": item.vendorName,
            "vendor_plant_code": item.vendorPlantCode,
          };
        }).toList();
    await box.put(AppConstants.mVendorSchema, dataToStore);
  }

  @override
  Future<List<Vendor>> getVendor() async {
    final data = box.get(AppConstants.mVendorSchema, defaultValue: []);
    final vendors = (data as List).cast<Map<String, dynamic>>();
    return vendors
        .map(
          (item) => Vendor(
            vendorId: item['vendor_id'],
            vendorCode: item['vendor_code'],
            vendorName: item['vendor_name'],
            vendorPlantCode: item['vendor_plant_code'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveAcitvity(List<Activity> activities) async {
    final List<Map<String, dynamic>> dataToStore =
        activities.map((item) {
          return {
            "activity_id": item.activityId,
            "activity_code": item.activityCode,
            "activity_name": item.activityName,
            "activity_uom": item.activityUom,
            "activity_cost_by_block": item.activityCostByBlock,
            "activity_cost_by_auc": item.activityCostByAuc,
            "activity_cost_by_order_number": item.activityCostByOrderNumber,
            "activity_cost_by_cost_center": item.activityCostByCostCenter,
            "activity_block_is_lc": item.activityBlockIsLc,
            "activity_block_is_immature": item.activityBlockIsImmature,
            "activity_block_is_mature": item.activityBlockIsMature,
            "activity_block_is_scout": item.activityBlockIsScout,
            "activity_uom_name": item.activityUomName,
            "activity_group_code": item.activityGroupCode,
            "activity_is_wbs_required": item.activityIsWbsRequired,
          };
        }).toList();
    await box.put(AppConstants.mActivitySchema, dataToStore);
  }

  @override
  Future<List<Activity>> getActivity() async {
    final data = box.get(AppConstants.mActivitySchema, defaultValue: []);
    final activities = (data as List).cast<Map<String, dynamic>>();
    return activities
        .map(
          (item) => Activity(
            activityId: item['activity_id'] ?? 0,
            activityCode: item['activity_code'] ?? '',
            activityName: item['activity_name'] ?? '',
            activityUom: item['activity_uom'] ?? '',
            activityCostByBlock: item['activity_cost_by_block'] ?? '',
            activityCostByAuc: item['activity_cost_by_auc'] ?? '',
            activityCostByOrderNumber:
                item['activity_cost_by_order_number'] ?? '',
            activityCostByCostCenter:
                item['activity_cost_by_cost_center'] ?? '',
            activityBlockIsLc: item['activity_block_is_lc'] ?? '',
            activityBlockIsImmature: item['activity_block_is_immature'] ?? '',
            activityBlockIsMature: item['activity_block_is_mature'] ?? '',
            activityBlockIsScout: item['activity_block_is_scout'] ?? '',
            activityUomName: item['activity_uom_name'] ?? '',
            activityGroupCode: item['activity_group_code'] ?? '',
            activityIsWbsRequired: item['activity_is_wbs_required'] ?? '',
          ),
        )
        .toList();
  }

  @override
  Future<void> saveAttendance(List<Attendance> attendances) async {
    final List<Map<String, dynamic>> dataToStore =
        attendances.map((item) {
          return {
            "attendance_id": item.attendanceId,
            "attendance_code": item.attendanceCode,
            "attendance_desc": item.attendanceDesc,
          };
        }).toList();
    await box.put(AppConstants.mAttendanceSchema, dataToStore);
  }

  @override
  Future<List<Attendance>> getAttendance() async {
    final data = box.get(AppConstants.mAttendanceSchema, defaultValue: []);
    final attendances = (data as List).cast<Map<String, dynamic>>();
    return attendances
        .map(
          (item) => Attendance(
            attendanceId: item['attendance_id'],
            attendanceCode: item['attendance_code'],
            attendanceDesc: item['attendance_desc'],
          ),
        )
        .toList();
  }

  @override
  Future<void> saveVra(List<Vra> vra) async {
    final List<Map<String, dynamic>> dataToStore =
        vra.map((item) {
          return {
            'vra_id': item.vraId,
            'vra_license_number': item.vraLicenseNumber,
            'vra_order_number': item.vraOrderNumber,
            'vra_equipment_code': item.vraEquipmentCode,
            'vra_object_type': item.vraObjectType,
            'vra_plant_code': item.vraPlantCode,
            'vra_meas_unit': item.vraMeasUnit,
            'vra_meas_point': item.vraMeasPoint,
            'vra_equipment': item.vraEquipment,
          };
        }).toList();
    await box.put(AppConstants.mVraSchema, dataToStore);
  }

  @override
  Future<List<Vra>> getVra() async {
    final data = box.get(AppConstants.mVraSchema, defaultValue: []);
    final vra = (data as List).cast<Map<String, dynamic>>();
    return vra
        .map(
          (item) => Vra(
            vraId: item['vra_id'] ?? 0,
            vraLicenseNumber: item['vra_license_number'] ?? '',
            vraOrderNumber: item['vra_order_number'] ?? '',
            vraEquipmentCode: item['vra_equipment_code'] ?? '',
            vraObjectType: item['vra_object_type'] ?? '',
            vraPlantCode: item['vra_plant_code'] ?? '',
            vraMeasUnit: item['vra_meas_unit'] ?? '',
            vraMeasPoint: item['vra_meas_point'] ?? '',
            vraEquipment: item['vra_equipment'] ?? '',
          ),
        )
        .toList();
  }
}

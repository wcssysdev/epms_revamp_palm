import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:epms_tech/domain/model/employee.dart';
import 'package:epms_tech/domain/model/harvesting_method.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';
import 'package:hive/hive.dart';

class MasterDataRepositoryImpl implements MasterDataRepository {
  // implementasi Repository - model JANGAN HAPUS
  final Box box;

  MasterDataRepositoryImpl({required this.box});

  @override
  Future<void> saveHarvestMethods(List<HarvestingMethod> harvestingMethods) async {
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
    final List<HarvestingMethod> data = box.get(
      AppConstants.mHarvestingMethodSchema,
      defaultValue: [],
    );
    return (data as List)
        .map(
          (item) => HarvestingMethod(
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
    final List<Map<String, dynamic>> dataToStore = employee.map((item) {
      return {
        'employee_id': item.employeeId,
        'employee_code': item.employeeCode,
        'employee_name': item.employeeName,
        'employee_job_code': item.employeeJobCode,
        'employee_profile': item.employeeProfile,
        'employee_gang_allotment_code': item.employeeGangAllotmentCode
      };
    }).toList();
    await box.put(AppConstants.mEmployeeSchema, dataToStore);
  }

  @override
  Future<List<Employee>> getEmployee() async {
    final List<Employee> data = box.get(
      AppConstants.mEmployeeSchema,
      defaultValue: []
    );

    return (data as List)
        .map(
          (item) => Employee( 
            employeeId: item['employee_id'], 
            employeeCode: item['employee_code'], 
            employeeName: item['employee_name'], 
            employeeJobCode: item['employee_job_ode'], 
            employeeProfile: item['employee_profile'], 
            employeeGangAllotmentCode: item['employee_gang_allotment_code']
            ),
        )
      .toList();
  }                    
}
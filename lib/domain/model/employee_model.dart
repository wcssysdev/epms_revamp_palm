import 'package:hive/hive.dart';
import 'package:epms_tech/domain/entities/employee.dart';
import 'package:epms_tech/core/constants/global_annotation_schema.dart';

part 'employee_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mEmployeeAnnotation)
class EmployeeModel implements Employee {
  @override
  @HiveField(0)
  final int employeeId;

  @override
  @HiveField(1)
  final String employeeCode;

  @override
  @HiveField(2)
  final String employeeName;

  @override
  @HiveField(3)
  final String employeeJobCode;

  @override
  @HiveField(4)
  final String employeeProfile;

  @override
  @HiveField(5)
  final String employeeGangAllotmentCode;

  EmployeeModel({
    required this.employeeId,
    required this.employeeCode,
    required this.employeeName,
    required this.employeeJobCode,
    required this.employeeProfile,
    required this.employeeGangAllotmentCode,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      employeeId: json['employee_id'] ?? 0,
      employeeCode: json['employee_code'] ?? '',
      employeeName: json['employee_name'] ?? '',
      employeeJobCode: json['employee_job_code'] ?? '',
      employeeProfile: json['employee_profile'] ?? '',
      employeeGangAllotmentCode: json['employee_gang_allotment_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employee_id': employeeId,
      'employee_code': employeeCode,
      'employee_name': employeeName,
      'employee_job_code': employeeJobCode,
      'employee_profile': employeeProfile,
      'employee_gang_allotment_code': employeeGangAllotmentCode,
    };
  }
}

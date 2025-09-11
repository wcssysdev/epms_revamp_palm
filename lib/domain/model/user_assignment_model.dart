import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:hive/hive.dart';

part 'user_assignment_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.tUserAssignmentAnnotation)
class UserAssignmentModel implements UserAssignment {
  @override
  @HiveField(0)
  final int mandorId;
  @override
  @HiveField(1)
  final String profileName;
  @override
  @HiveField(2)
  final String mandorEmployeeCode;
  @override
  @HiveField(3)
  final String mandorEmployeeName;
  @override
  @HiveField(4)
  final String employeeCode;
  @override
  @HiveField(5)
  final String employeeName;

  UserAssignmentModel({
    required this.mandorId,
    required this.profileName,
    required this.mandorEmployeeCode,
    required this.mandorEmployeeName,
    required this.employeeCode,
    required this.employeeName,
  });

/*
[{mandor_id: 43898, profile_name: ESTATE A, mandor_employee_code: 00/00EA/1114/122, mandor_employee_name: FLORIANUS JEMADU, employee_code: 00/00EA/0120/1130, employee_name: YOSEPH SABULON, start_validity: 2025-06-01, end_validity: 9999-12-31, created_by: 1, created_date: 2025-08-13, created_time: 05:27:14, updated_by: 1, updated_date: 2025-08-13, updated_time: 05:27:14}, {mandor_id: 43901, profile_name: ESTATE A, mandor_employee_code: 00/00EA/0521/1901, mandor_employee_name: THOMAS AQUINO KELU, employee_code: 00/00EA/0120/1135, employee_name: SERGIUS KOMI, start_validity: 2025-08-01, end_validity: 9999-12-31, created_by: 1, created_date: 2025-08-13, created_time: 05:27:14, updated_by: 1, updated_date: 2025-08-13, updated_time: 05:27:14}, {mandor_id: 43902, profile_name: ESTATE A, mandor_employee_code: 00/00EA/0812/162, mandor_employee_name: URBANUS SARENG, employee_code: 00/00EA/0120/1139, employee_name: CLEMENS KAUT KANIMU, start_validity: 2025-06-01, end_validity: 9999-12-31, created_by: 1, created_da
 */
  factory UserAssignmentModel.fromJson(Map<String, dynamic> json) {
    return UserAssignmentModel(
      mandorId: json['mandor_id'] ?? 0,
      profileName: json['profile_name'] ?? '',
      mandorEmployeeCode: json['mandor_employee_code'] ?? '',
      mandorEmployeeName: json['mandor_employee_name'] ?? '',
      employeeCode: json['employee_code'] ?? '',
      employeeName: json['employee_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mandor_id": mandorId,
      "profile_name": profileName,
      "mandor_employee_code": mandorEmployeeCode,
      "mandor_employee_name": mandorEmployeeName,
      "employee_code": employeeCode,
      "employee_name": employeeName,
    };
  }
}

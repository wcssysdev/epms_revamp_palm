import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'config_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mConfigAnnotation)
class ConfigModel implements Config {
  @override
  @HiveField(0)
  final int configId;
  @override
  @HiveField(1)
  final String companyCode;
  @override
  @HiveField(2)
  final String companyName;
  @override
  @HiveField(3)
  final String profileCode;
  @override
  @HiveField(4)
  final String profileName;
  @override
  @HiveField(5)
  final String estateCode;
  @override
  @HiveField(6)
  final String estateName;
  @override
  @HiveField(7)
  final String plantCode;
  @override
  @HiveField(8)
  final String attendanceDefaultValue;
  @override
  @HiveField(9)
  final String integrationType;
  @override
  @HiveField(10)
  final String attendanceNormalDefaultValue;
  @override
  @HiveField(11)
  final String systemIsPalm;
  @override
  @HiveField(12)
  final String dailyOvertimeMaxLimit;
  @override
  @HiveField(13)
  final String additionalSettings;
  @override
  @HiveField(14)
  final String attendanceUnattenddeValue;
  @override
  @HiveField(15)
  final String? attendanceUnattendedValue;
  @override
  @HiveField(16)
  final String token;
  @override
  @HiveField(17)
  final String employeeCode;
  @override
  @HiveField(18)
  final String employeeName;
  @override
  @HiveField(19)
  final int userId;
  @override
  @HiveField(20)
  final List<AllowedAttendanceCodeModel> allowedAttendanceCodeForWorkAssignment; // harus ...CodeModel JANGAN HAPUS
  @override
  @HiveField(21)
  final int loginDeviceId;

  ConfigModel({
    required this.configId,
    required this.companyCode,
    required this.companyName,
    required this.profileCode,
    required this.profileName,
    required this.estateCode,
    required this.estateName,
    required this.plantCode,
    required this.attendanceDefaultValue,
    required this.integrationType,
    required this.attendanceNormalDefaultValue,
    required this.systemIsPalm,
    required this.dailyOvertimeMaxLimit,
    required this.additionalSettings,
    required this.attendanceUnattenddeValue,
    this.attendanceUnattendedValue,
    required this.token,
    required this.employeeCode,
    required this.employeeName,
    required this.userId,
    required this.allowedAttendanceCodeForWorkAssignment,
    required this.loginDeviceId,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      configId: json['config_id'] ?? 0,
      companyCode: json['company_code'] ?? '',
      companyName: json['company_name'] ?? '',
      profileCode: json['profile_code'] ?? '',
      profileName: json['profile_name'] ?? '',
      estateCode: json['estate_code'] ?? '',
      estateName: json['estate_name'] ?? '',
      plantCode: json['plant_code'] ?? '',
      attendanceDefaultValue: json['attendance_default_value'] ?? '',
      integrationType: json['integration_type'] ?? '',
      attendanceNormalDefaultValue:
          json['attendance_normal_default_value'] ?? '',
      systemIsPalm: json['system_is_palm'] ?? '',
      dailyOvertimeMaxLimit: json['daily_overtime_max_limit'] ?? '',
      additionalSettings: json['additional_settings'] ?? '',
      attendanceUnattenddeValue: json['attendance_unattendde_value'] ?? '',
      attendanceUnattendedValue: json['attendance_unattended_value'] ?? '',
      token: json['token'] ?? '',
      employeeCode: json['employee_code'] ?? '',
      employeeName: json['employee_name'] ?? '',
      userId: json['user_id'] ?? '',
      allowedAttendanceCodeForWorkAssignment:
          (json['allowed_attendance_codes_for_work_assignment']
                  as List<dynamic>)
              .map((item) => AllowedAttendanceCodeModel.fromJson(item))
              .toList(),
      loginDeviceId: json['login_device_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "config_id": configId,
      "company_code": companyCode,
      "company_name": companyName,
      "profile_code": profileCode,
      "profile_name": profileName,
      "estate_code": estateCode,
      "estate_name": estateName,
      "plant_code": plantCode,
      "attendance_default_value": attendanceDefaultValue,
      "integration_type": integrationType,
      "attendance_normal_default_value": attendanceNormalDefaultValue,
      "system_is_palm": systemIsPalm,
      "daily_overtime_max_limit": dailyOvertimeMaxLimit,
      "additional_settings": additionalSettings,
      "attendance_unattendde_value": attendanceUnattenddeValue,
      "attendance_unattended_value": attendanceUnattendedValue,
      "token": token,
      "employee_code": employeeCode,
      "employee_name": employeeName,
      "user_id": userId,
      "allowed_attendance_codes_for_work_assignment":
          allowedAttendanceCodeForWorkAssignment
              .map((e) => e.toJson())
              .toList(),
      "login_device_id": loginDeviceId,
    };
  }
}

@HiveType(typeId: GlobalAnnotationSchema.mAllowedAttendanceCodeAnnotation)
class AllowedAttendanceCodeModel implements AllowedAttendanceCode {
  @override
  @HiveField(0)
  final String allowedAttendanceCode;

  AllowedAttendanceCodeModel({required this.allowedAttendanceCode});

  factory AllowedAttendanceCodeModel.fromJson(Map<String, dynamic> json) {
    return AllowedAttendanceCodeModel(
      allowedAttendanceCode: json['allowed_attendance_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"allowed_attendance_code": allowedAttendanceCode};
  }

  factory AllowedAttendanceCodeModel.fromEntity(AllowedAttendanceCode entity) {
    return AllowedAttendanceCodeModel(
      allowedAttendanceCode: entity.allowedAttendanceCode,
    );
  }
}

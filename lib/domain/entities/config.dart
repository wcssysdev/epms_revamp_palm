class Config {
  final int configId;
  final String companyCode;
  final String companyName;
  final String profileCode;
  final String profileName;
  final String estateCode;
  final String estateName;
  final String plantCode;
  final String attendanceDefaultValue;
  final String integrationType;
  final String attendanceNormalDefaultValue;
  final String systemIsPalm;
  final String dailyOvertimeMaxLimit;
  final String additionalSettings;
  final String attendanceUnattenddeValue;
  final String? attendanceUnattendedValue;
  final String token;
  final String employeeCode;
  final String employeeName;
  final int userId;
  final List<AllowedAttendanceCode> allowedAttendanceCodeForWorkAssignment;
  final int loginDeviceId;

  Config({
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
}

class AllowedAttendanceCode {
  final String allowedAttendanceCode;
  AllowedAttendanceCode({required this.allowedAttendanceCode});
}

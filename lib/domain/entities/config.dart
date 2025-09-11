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

/*
{
                "config_id": 1,
                "company_code": "00",
                "company_name": "BIA INTI AGRINDO",
                "profile_code": "ESTATE A",
                "profile_name": "ESTATE A",
                "estate_code": "EA",
                "estate_name": "ESTATE A",
                "plant_code": "00EA",
                "attendance_default_value": "K",
                "integration_type": "1",
                "attendance_normal_default_value": "K",
                "system_is_palm": "t",
                "daily_overtime_max_limit": "16",
                "additional_settings": "{\"take_picture_oph\":\"N\",\"take_picture_cp1\":\"N\",\"take_picture_cp2\":\"N\",\"take_picture_fdn\":\"N\",\"take_location_oph\":\"N\",\"take_location_cp1\":\"N\",\"take_location_cp2\":\"N\",\"take_location_fdn\":\"N\",\"oph_scan_task\":\"N\",\"oph_scan_card\":\"N\"}",
                "attendance_unattendde_value": "M",
                "attendance_unattended_value": null,
                "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6Ijg4IiwidXNlcm5hbWUiOiJyb2phIiwiaWF0IjoxNzU1MjIzMzMzfQ.4ozONGWLYdKIcj0-pi_6odW51xSoS0NgTRsWyIpEHXA",
                "employee_code": "00/00EA/0812/136",
                "employee_name": "MARTINUS ROJA",
                "user_id": 88,
                "allowed_attendance_codes_for_work_assignment": [
                    {
                        "allowed_attendance_code": "K"
                    },
                    {
                        "allowed_attendance_code": "KL"
                    },
                    {
                        "allowed_attendance_code": "KT"
                    }
                ],
                "login_device_id": 3506
            }

*/

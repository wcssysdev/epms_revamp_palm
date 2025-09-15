class Employee {
  final int employeeId;
  final String employeeCode;
  final String employeeName;
  final String employeeJobCode;
  final String employeeProfile;
  final String employeeGangAllotmentCode;

  Employee({
    required this.employeeId,
    required this.employeeCode,
    required this.employeeName,
    required this.employeeJobCode,
    required this.employeeProfile,
    required this.employeeGangAllotmentCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'employeeCode': employeeCode,
      'employeeName': employeeName,
      'employeeJobCode': employeeJobCode,
      'employeeProfile': employeeProfile,
      'employeeGangAllotmentCode': employeeGangAllotmentCode,
    };
  }

  @override
  String toString() => toJson().toString();
}

class UserAssignment {
  final int mandorId;
  final String profileName;
  final String mandorEmployeeCode;
  final String mandorEmployeeName;
  final String employeeCode;
  final String employeeName;

  UserAssignment({
    required this.mandorId,
    required this.profileName,
    required this.mandorEmployeeCode,
    required this.mandorEmployeeName,
    required this.employeeCode,
    required this.employeeName,
  });

  Map<String, dynamic> toJson() {
    return {
      "mandorId": mandorId,
      "profileName": profileName,
      "mandorEmployeeCode": mandorEmployeeCode,
      "mandorEmployeeName": mandorEmployeeName,
      "employeeCode": employeeCode,
      "employeeName": employeeName,
    };
  }

  @override
  String toString() => toJson().toString(); // 
  // toJson().toString() berjalan bareng => untuk return data object list <Map<String, dynamic>> dynamically
  // JANGAN HAPUS
}

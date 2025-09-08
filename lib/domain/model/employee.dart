import 'package:hive/hive.dart';

part 'employee.g.dart';

@HiveType(typeId: 2)
class Employee { // entity Employee
  @HiveField(0)
  int employeeId;
  @HiveField(1)
  String employeeCode;
  @HiveField(2)
  String employeeName;
  @HiveField(3)
  String employeeJobCode;
  @HiveField(4)
  String employeeProfile;
  @HiveField(5)
  String employeeGangAllotmentCode;

  Employee({
    required this.employeeId,
    required this.employeeCode,
    required this.employeeName,
    required this.employeeJobCode,
    required this.employeeProfile,
    required this.employeeGangAllotmentCode,
  });
}
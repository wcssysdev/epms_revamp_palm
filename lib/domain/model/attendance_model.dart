import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/attendance.dart';
import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mAttendanceAnnotation)
class AttendanceModel implements Attendance {
  @override
  @HiveField(0)
  final int attendanceId;
  @override
  @HiveField(1)
  final String attendanceCode;
  @override
  @HiveField(2)
  final String attendanceDesc;

  AttendanceModel({
    required this.attendanceId,
    required this.attendanceCode,
    required this.attendanceDesc,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      attendanceId: json['attendance_id'] ?? 0,
      attendanceCode: json['attendance_code'] ?? '',
      attendanceDesc: json['attendance_desc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "attendance_id": attendanceId,
      "attendance_code": attendanceCode,
      "attendance_desc": attendanceDesc,
    };
  }
}

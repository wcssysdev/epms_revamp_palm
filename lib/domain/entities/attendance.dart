class Attendance {
  final int attendanceId;
  final String attendanceCode;
  final String attendanceDesc;

  Attendance({
    required this.attendanceId,
    required this.attendanceCode,
    required this.attendanceDesc,
  });

  Map<String, dynamic> toJson() {
    return {
      'attendanceId': attendanceId,
      'attendanceCode': attendanceCode,
      'attendanceDesc': attendanceDesc,
    };
  }

  @override
  String toString() => toJson().toString();
}

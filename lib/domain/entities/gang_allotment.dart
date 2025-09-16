class GangAllotment {
  final String gangAllotmentId;
  final String gangAllotmentMandorEmployeeCode;
  final String gangAllotmentMandorEmployeeName;

  GangAllotment({
    required this.gangAllotmentId,
    required this.gangAllotmentMandorEmployeeCode,
    required this.gangAllotmentMandorEmployeeName,
  });

  Map<String, dynamic> toJson() {
    return {
      'gangAllotmentId': gangAllotmentId,
      'gangAllotmentMandorEmployeeCode': gangAllotmentMandorEmployeeCode,
      'gangAllotmentMandorEmployeeName': gangAllotmentMandorEmployeeName,
    };
  }

  @override
  String toString() => toJson().toString();
}

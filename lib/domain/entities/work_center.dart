class WorkCenter {
  final int workCenterId;
  final String workCenterCode;
  final String workCenterName;
  final String workCenterCompanyCode;
  final String workCenterPlantCode;
  final String workCenterEstateCode;
  final String workCenterDivisionCode;

  WorkCenter({
    required this.workCenterId,
    required this.workCenterCode,
    required this.workCenterName,
    required this.workCenterCompanyCode,
    required this.workCenterPlantCode,
    required this.workCenterEstateCode,
    required this.workCenterDivisionCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'workCenterId': workCenterId,
      'workCenterCode': workCenterCode,
      'workCenterName': workCenterName,
      'workCenterCompanyCode': workCenterCompanyCode,
      'workCenterPlantCode': workCenterPlantCode,
      'workCenterEstateCode': workCenterEstateCode,
      'workCenterDivisionCode': workCenterDivisionCode,
    };
  }

  @override
  String toString() => toJson().toString();
}

class Vra {
  final int vraId;
  final String vraLicenseNumber;
  final String vraOrderNumber;
  final String vraEquipmentCode;
  final String vraObjectType;
  final String vraPlantCode;
  final String vraMeasUnit;
  final String vraMeasPoint;
  final String vraEquipment;

  Vra({
    required this.vraId,
    required this.vraLicenseNumber,
    required this.vraOrderNumber,
    required this.vraEquipmentCode,
    required this.vraObjectType,
    required this.vraPlantCode,
    required this.vraMeasUnit,
    required this.vraMeasPoint,
    required this.vraEquipment,
  });

  Map<String, dynamic> toJson() {
    return {
      'vraId': vraId,
      'vraLicenseNumber': vraLicenseNumber,
      'vraOrderNumber': vraOrderNumber,
      'vraEquipmentCode': vraEquipmentCode,
      'vraObjectType': vraObjectType,
      'vraPlantCode': vraPlantCode,
      'vraMeasUnit': vraMeasUnit,
      'vraMeasPoint': vraMeasPoint,
      'vraEquipment': vraEquipment,
    };
  }

  @override
  String toString() => toJson().toString();
}

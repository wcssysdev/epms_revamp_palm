class Vendor {
  final int vendorId;
  final String vendorCode;
  final String vendorName;
  final String vendorPlantCode;

  Vendor({
    required this.vendorId,
    required this.vendorCode,
    required this.vendorName,
    required this.vendorPlantCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'vendorId': vendorId,
      'vendorCode': vendorCode,
      'vendorName': vendorName,
      'vendorPlantCode': vendorPlantCode,
    };
  }

  @override
  String toString() => toJson().toString();
}

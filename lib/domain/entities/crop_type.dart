class CropType {
  final String cropTypeCode;
  final String cropTypeName;
  final String description;
  final String canHarvest;

  CropType({
    required this.cropTypeCode,
    required this.cropTypeName,
    required this.description,
    required this.canHarvest,
  });

  Map<String, dynamic> toJson() {
    return {
      'cropTypeCode': cropTypeCode,
      'cropTypeName': cropTypeName,
      'description': description,
      'canHarvest': canHarvest,
    };
  }

  @override
  String toString() => toJson().toString();
}

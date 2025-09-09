class CropType {
  final String cropTypeCode;
  final String cropTypeName;
  final String description;
  final bool canHarvest;
  
  CropType({
    required this.cropTypeCode,
    required this.cropTypeName,
    required this.description,
    required this.canHarvest,
  });
}

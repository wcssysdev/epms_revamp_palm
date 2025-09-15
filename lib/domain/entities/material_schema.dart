class MaterialSchema {
  final int materialId;
  final String materialCode;
  final String materialName;
  final String materialUom;
  final String materialPlantCode;
  final String materialSloc;
  final String materialBatch;
  final String materialGroup;
  final String materialType;

  MaterialSchema({
    required this.materialId,
    required this.materialCode,
    required this.materialName,
    required this.materialUom,
    required this.materialPlantCode,
    required this.materialSloc,
    required this.materialBatch,
    required this.materialGroup,
    required this.materialType,
  });

  Map<String, dynamic> toJson() {
    return {
      'materialId': materialId,
      'materialCode': materialCode,
      'materialName': materialName,
      'materialUom': materialUom,
      'materialPlantCode': materialPlantCode,
      'materialSloc': materialSloc,
      'materialBatch': materialBatch,
      'materialGroup': materialGroup,
      'materialType': materialType,
    };
  }

  @override
  String toString() => toJson().toString();
}

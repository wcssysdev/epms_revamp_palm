import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/material_schema.dart';
import 'package:hive/hive.dart';

part 'material_schema_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mMaterialAnnotation)
class MaterialSchemaModel implements MaterialSchema {
  @override
  @HiveField(0)
  final int materialId;
  @override
  @HiveField(1)
  final String materialCode;
  @override
  @HiveField(2)
  final String materialName;
  @override
  @HiveField(3)
  final String materialUom;
  @override
  @HiveField(4)
  final String materialPlantCode;
  @override
  @HiveField(5)
  final String materialSloc;
  @override
  @HiveField(6)
  final String materialBatch;
  @override
  @HiveField(7)
  final String materialGroup;
  @override
  @HiveField(8)
  final String materialType;

  MaterialSchemaModel({
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

  factory MaterialSchemaModel.fromJson(Map<String, dynamic> json) {
    return MaterialSchemaModel(
      materialId: json['material_id'],
      materialCode: json['material_code'],
      materialName: json['material_name'],
      materialUom: json['material_uom'],
      materialPlantCode: json['material_plant_code'],
      materialSloc: json['material_sloc'],
      materialBatch: json['material_batch'],
      materialGroup: json['material_group'],
      materialType: json['material_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "material_id": materialId,
      "material_code": materialCode,
      "material_name": materialName,
      "material_uom": materialUom,
      "material_plant_code": materialPlantCode,
      "material_sloc": materialSloc,
      "material_batch": materialBatch,
      "material_group": materialGroup,
      "material_type": materialType,
    };
  }
}

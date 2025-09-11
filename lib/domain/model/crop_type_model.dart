import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:hive/hive.dart';

part 'crop_type_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mCropTypeAnnotation)
class CropTypeModel implements CropType {
  @override
  @HiveField(0)
  String cropTypeCode;
  @override
  @HiveField(1)
  String cropTypeName;
  @override
  @HiveField(2)
  String description;
  @override
  @HiveField(3)
  String canHarvest;

  CropTypeModel({
    required this.cropTypeCode,
    required this.cropTypeName,
    required this.description,
    required this.canHarvest,
  });

  factory CropTypeModel.fromJson(Map<String, dynamic> json) {
    return CropTypeModel(
      cropTypeCode: json['croptypecode'] ?? '',
      cropTypeName: json['croptypename'] ?? '',
      description: json['description'] ?? '',
      canHarvest: json['canharvest'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'croptypecode': cropTypeCode,
      'croptypename': cropTypeName,
      'description': description,
      'canharvest': canHarvest,
    };
  }
}

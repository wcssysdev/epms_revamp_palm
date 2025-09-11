import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/master_block.dart';
import 'package:hive/hive.dart';

part 'master_block_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mBlockAnnotation)
class MasterBlockModel implements MasterBlock {
  @override
  @HiveField(0)
  final int blockId;
  @override
  @HiveField(1)
  final String blockCompanyCode;
  @override
  @HiveField(2)
  final String blockEstateCode;
  @override
  @HiveField(3)
  final String blockDivisionCode;
  @override
  @HiveField(4)
  final String blockCode;
  @override
  @HiveField(5)
  final String blockName;
  @override
  @HiveField(6)
  final String blockHectarage;
  @override
  @HiveField(7)
  final String blockState;
  @override
  @HiveField(8)
  final String blockCropType;

  MasterBlockModel({
    required this.blockId,
    required this.blockCompanyCode,
    required this.blockEstateCode,
    required this.blockDivisionCode,
    required this.blockCode,
    required this.blockName,
    required this.blockHectarage,
    required this.blockState,
    required this.blockCropType,
  });

  factory MasterBlockModel.fromJson(Map<String, dynamic> json) {
    return MasterBlockModel(
      blockId: json['block_id'] ?? 0,
      blockCompanyCode: json['block_company_code'] ?? '',
      blockEstateCode: json['block_estate_code'] ?? '',
      blockDivisionCode: json['block_division_code'] ?? '',
      blockCode: json['block_code'] ?? '',
      blockName: json['block_name'] ?? '',
      blockHectarage: json['block_hectarage'] ?? '',
      blockState: json['block_state'] ?? '',
      blockCropType: json['block_crop_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "block_id": blockId,
      "block_company_code": blockCompanyCode,
      "block_estate_code": blockEstateCode,
      "block_division_code": blockDivisionCode,
      "block_code": blockCode,
      "block_name": blockName,
      "block_hectarage": blockHectarage,
      "block_state": blockState,
      "block_crop_type": blockCropType,
    };
  }
}

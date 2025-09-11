import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/uom.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'uom_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mUomAnnotation)
class UomModel implements Uom {
  @override
  @HiveField(0)
  final String uomId;
  @override
  @HiveField(1)
  final String uomCode;
  @override
  @HiveField(2)
  final String uomDesc;

  UomModel({required this.uomId, required this.uomCode, required this.uomDesc});

  factory UomModel.fromJson(Map<String, dynamic> json) {
    return UomModel(
      uomId: json['uom_id'] ?? '',
      uomCode: json['uom_code'] ?? '',
      uomDesc: json['uom_desc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"uom_id": uomId, "uom_code": uomCode, "uom_desc": uomDesc};
  }
}

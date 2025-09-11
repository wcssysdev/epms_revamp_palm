import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/vra_type.dart';
import 'package:hive/hive.dart';

part 'vra_type_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mVraTypeAnnotation)
class VraTypeModel implements VraType {
  @override
  @HiveField(0)
  final String vraObjectType;
  @override
  @HiveField(1)
  final int typeId;

  VraTypeModel({required this.vraObjectType, required this.typeId});

  factory VraTypeModel.fromJson(Map<String, dynamic> json) {
    return VraTypeModel(
      vraObjectType: json['vra_object_type'] ?? '',
      typeId: json['type_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'vra_object_type': vraObjectType, 'type_id': typeId};
  }
}

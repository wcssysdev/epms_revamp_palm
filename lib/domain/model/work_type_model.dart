import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/work_type.dart';
import 'package:hive/hive.dart';

part 'work_type_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mWorkTypeAnnotation)
class WorkTypeModel implements WorkType{
  @override
  @HiveField(0)
  int workTypeId;

  @override
  @HiveField(1)
  String workTypeCode;

  @override
  @HiveField(2)
  String workTypeName;

  WorkTypeModel({
    required this.workTypeId,
    required this.workTypeCode,
    required this.workTypeName,
  });

  factory WorkTypeModel.fromJson(Map<String, dynamic> json) {
    return WorkTypeModel(
      workTypeId: json['work_type_id'] ?? 0,
      workTypeCode: json['work_type_code'] ?? '',
      workTypeName: json['work_type_name'] ?? '',
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'work_type_id': workTypeId,
      'work_type_code': workTypeCode,
      'work_type_name': workTypeName
    };
  }

}
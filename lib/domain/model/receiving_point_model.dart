import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/receiving_point.dart';
import 'package:hive/hive.dart';

part 'receiving_point_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mReceivingPointAnnotation)
class ReceivingPointModel implements RecevingPoint {
  @override
  @HiveField(0)
  final int receivingPointId;
  @override
  @HiveField(1)
  final String receivingPointCode;

  ReceivingPointModel({
    required this.receivingPointId,
    required this.receivingPointCode,
  });

  factory ReceivingPointModel.fromJson(Map<String, dynamic> json) {
    return ReceivingPointModel(
      receivingPointId: json['receiving_point_id'],
      receivingPointCode: json['receiving_point_code'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'receiving_point_id': receivingPointId,
      'receiving_point_code': receivingPointCode,
    };
  }
}

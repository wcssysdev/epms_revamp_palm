import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/destination.dart';
import 'package:hive/hive.dart';

part 'destination_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mDestinationAnnotation)
class DestinationModel implements Destination {
  @override
  @HiveField(0)
  final int destinationId;
  @override
  @HiveField(1)
  final String destinationCode;
  @override
  @HiveField(2)
  final String destinationName;

  DestinationModel({
    required this.destinationId,
    required this.destinationCode,
    required this.destinationName,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      destinationId: json['destination_id'] ?? 0,
      destinationCode: json['destination_code'] ?? '',
      destinationName: json['destination_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "destination_id": destinationId,
      "destination_code": destinationCode,
      "destination_name": destinationName,
    };
  }
}

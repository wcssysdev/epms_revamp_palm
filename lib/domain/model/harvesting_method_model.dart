import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/harvesting_method.dart';
import 'package:hive/hive.dart';

part 'harvesting_method_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mHarvestingMethodAnnotation)

class HarvestingMethodModel implements HarvestingMethod { // entity HarvestingMethod
  @override
  @HiveField(0)
  final int mhmId;

  @override
  @HiveField(1)
  final String mhmIndicator;

  @override
  @HiveField(2)
  final String mhmAbbreviation;

  @override
  @HiveField(3)
  final String mhmDescription;

  HarvestingMethodModel({
    required this.mhmId,
    required this.mhmIndicator,
    required this.mhmAbbreviation,
    required this.mhmDescription,
  });

  factory HarvestingMethodModel.fromJson(Map<String, dynamic> json) {
    return HarvestingMethodModel(
      mhmId: json['mhm_id'] ?? 0,
      mhmIndicator: json['mhm_indicator'] ?? '',
      mhmAbbreviation: json['mhm_abbreviation'] ?? '',
      mhmDescription: json['mhm_description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mhm_id': mhmId,
      'mhm_indicator': mhmIndicator,
      'mhm_abbreviation': mhmAbbreviation,
      'mhm_description': mhmDescription,
    };
  }
}

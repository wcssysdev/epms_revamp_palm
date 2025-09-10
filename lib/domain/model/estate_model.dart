import 'package:epms_tech/domain/entities/estate.dart';
import 'package:hive/hive.dart';
import 'package:epms_tech/core/constants/global_annotation_schema.dart';

part 'estate_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mEstateAnnotation)
class EstateModel implements Estate {
  @override
  @HiveField(0)
  final int estateId;
  @override
  @HiveField(1)
  final String estateCompanyCode;
  @override
  @HiveField(2)
  final String estateCode;
  @override
  @HiveField(3)
  final String estateName;
  @override
  @HiveField(4)
  final String estatePlantCode;

  EstateModel({
    required this.estateId,
    required this.estateCompanyCode,
    required this.estateCode,
    required this.estateName,
    required this.estatePlantCode,
  });

  factory EstateModel.fromJson(Map<String, dynamic> json) {
    return EstateModel(
      estateId: json['estate_id'],
      estateCompanyCode: json['estate_company_code'],
      estateCode: json['estate_code'],
      estateName: json['estate_name'],
      estatePlantCode: json['estate_plant_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'estate_id': estateId,
      'estate_company_code': estateCompanyCode,
      'estate_code': estateCode,
      'estate_name': estateName,
      'estate_plant_code': estatePlantCode,
    };
  }
}

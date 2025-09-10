import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/division.dart';
import 'package:hive/hive.dart';

part 'division_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mDivisionAnnotation)
class DivisionModel implements Division{
  @override
  @HiveField(0)
  final int divisionId;
  @override
  @HiveField(1)
  final String divisionCompanyCode;
  @override
  @HiveField(2)
  final String divisionEstateCode;
  @override
  @HiveField(3)
  final String divisionCode;
  @override
  @HiveField(4)
  final String divisionName;

  DivisionModel({
    required this.divisionId,
    required this.divisionCompanyCode,
    required this.divisionEstateCode,
    required this.divisionCode,
    required this.divisionName,
  });

  factory DivisionModel.fromJson(Map<String, dynamic> json) {
    return DivisionModel(
      divisionId: json['division_id'],
      divisionCompanyCode: json['division_company_code'], 
      divisionEstateCode: json['division_estate_code'], 
      divisionCode: json['division_code'], 
      divisionName: json['division_name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "division_id": divisionId,
      "division_company_code": divisionCompanyCode,
      "division_estate_code": divisionEstateCode,
      "division_code": divisionCode,
      "division_name": divisionName,
    };
  }
}
import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/work_center.dart';
import 'package:hive/hive.dart';

part 'work_center_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mWorkCenterAnnotation)
class WorkCenterModel implements WorkCenter {
  @override
  @HiveField(0)
  final int workCenterId;

  @override
  @HiveField(1)
  final String workCenterCode;
  @override
  @HiveField(2)
  final String workCenterName;
  @override
  @HiveField(3)
  final String workCenterCompanyCode;
  @override
  @HiveField(4)
  final String workCenterPlantCode;
  @override
  @HiveField(5)
  final String workCenterEstateCode;
  @override
  @HiveField(6)
  final String workCenterDivisionCode;

  WorkCenterModel({
    required this.workCenterId,
    required this.workCenterCode,
    required this.workCenterName,
    required this.workCenterCompanyCode,
    required this.workCenterPlantCode,
    required this.workCenterEstateCode,
    required this.workCenterDivisionCode,
  });

  factory WorkCenterModel.fromJson(Map<String, dynamic> json) {
    return WorkCenterModel(
      workCenterId: json['work_center_id'], 
      workCenterCode: json['work_center_code'], 
      workCenterName: json['work_center_name'], 
      workCenterCompanyCode: json['work_center_company_code'], 
      workCenterPlantCode: json['work_center_plant_code'], 
      workCenterEstateCode: json['work_center_estate_code'], 
      workCenterDivisionCode: json['work_center_division_code']
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'work_center_id': workCenterId,
      'work_center_code': workCenterCode,
      'work_center_name': workCenterName,
      'work_center_company_code': workCenterCompanyCode,
      'work_center_plant_code': workCenterPlantCode,
      'work_center_estate_code': workCenterEstateCode,
      'work_center_division_code': workCenterDivisionCode,
    };
  }
}
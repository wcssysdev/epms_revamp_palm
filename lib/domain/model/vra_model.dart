import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/vra.dart';
import 'package:hive/hive.dart';

part 'vra_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mVraAnnotation)
class VraModel implements Vra {
  @override
  @HiveField(0)
  final int vraId;
  @override
  @HiveField(1)
  final String vraLicenseNumber;
  @override
  @HiveField(2)
  final String vraOrderNumber;
  @override
  @HiveField(3)
  final String vraEquipmentCode;
  @override
  @HiveField(4)
  final String vraObjectType;
  @override
  @HiveField(5)
  final String vraPlantCode;
  @override
  @HiveField(6)
  final String vraMeasUnit;
  @override
  @HiveField(7)
  final String vraMeasPoint;
  @override
  @HiveField(8)
  final String vraEquipment;

  VraModel({
    required this.vraId,
    required this.vraLicenseNumber,
    required this.vraOrderNumber,
    required this.vraEquipmentCode,
    required this.vraObjectType,
    required this.vraPlantCode,
    required this.vraMeasUnit,
    required this.vraMeasPoint,
    required this.vraEquipment,
  });

  factory VraModel.fromJson(Map<String, dynamic> json) {
    return VraModel(
      vraId: json['vra_id'] ?? 0,
      vraLicenseNumber: json['vra_license_number'] ?? '',
      vraOrderNumber: json['vra_order_number'] ?? '',
      vraEquipmentCode: json['vra_equipment_code'] ?? '',
      vraObjectType: json['vra_object_type'] ?? '',
      vraPlantCode: json['vra_plant_code'] ?? '',
      vraMeasUnit: json['vra_meas_unit'] ?? '',
      vraMeasPoint: json['vra_meas_point'] ?? '',
      vraEquipment: json['vra_equipment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vra_id': vraId,
      'vra_license_number': vraLicenseNumber,
      'vra_order_number': vraOrderNumber,
      'vra_equipment_code': vraEquipmentCode,
      'vra_object_type': vraObjectType,
      'vra_plant_code': vraPlantCode,
      'vra_meas_unit': vraMeasUnit,
      'vra_meas_point': vraMeasPoint,
      'vra_equipment': vraEquipment,
    };
  }
}

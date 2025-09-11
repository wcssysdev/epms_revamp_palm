import 'package:epms_tech/domain/entities/vendor.dart';
import 'package:hive/hive.dart';
import 'package:epms_tech/core/constants/global_annotation_schema.dart';

part 'vendor_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mVendorAnnotation)
class VendorModel implements Vendor{
  @override
  @HiveField(0)
  final int vendorId;
  @override
  @HiveField(1)
  final String vendorCode;
  @override
  @HiveField(2)
  final String vendorName;
    @override
  @HiveField(3)
  final String vendorPlantCode;

  VendorModel({
    required this.vendorId,
    required this.vendorCode,
    required this.vendorName,
    required this.vendorPlantCode,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      vendorId: json['vendor_id'] ?? 0,
      vendorCode: json['vendor_code'] ?? '',
      vendorName: json['vendor_name'] ?? '',
      vendorPlantCode: json['vendor_plant_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "vendor_id": vendorId,
      "vendor_code": vendorCode,
      "vendor_name": vendorName,
      "vendor_plant_code": vendorPlantCode,
    };
  }
}
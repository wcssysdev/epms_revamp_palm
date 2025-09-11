import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/tph.dart';
import 'package:hive/hive.dart';

part 'tph_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mTphAnnotation)
class TphModel implements Tph {
  @override
  @HiveField(0)
  final int tphId;
  @override
  @HiveField(1)
  final String tphCompanyCode;
  @override
  @HiveField(2)
  final String tphEstateCode;
  @override
  @HiveField(3)
  final String tphDivisionCode;
  @override
  @HiveField(4)
  final String tphBlockCode;
  @override
  @HiveField(5)
  final String tphSectionCode;
  @override
  @HiveField(6)
  final String tphCode;
  @override
  @HiveField(7)
  final String tphLatitude;
  @override
  @HiveField(8)
  final String tphLongitude;
  @override
  @HiveField(9)
  final String tphPalmTotal;

  TphModel({
    required this.tphId,
    required this.tphCompanyCode,
    required this.tphEstateCode,
    required this.tphDivisionCode,
    required this.tphBlockCode,
    required this.tphSectionCode,
    required this.tphCode,
    required this.tphLatitude,
    required this.tphLongitude,
    required this.tphPalmTotal,
  });

  factory TphModel.fromJson(Map<String, dynamic> json) {
    return TphModel(
      tphId: json['tph_id'] ?? 0,
      tphCompanyCode: json['tph_company_code'] ?? '',
      tphEstateCode: json['tph_estate_code'] ?? '',
      tphDivisionCode: json['tph_division_code'] ?? '',
      tphBlockCode: json['tph_block_code'] ?? '',
      tphSectionCode: json['tph_section_code'] ?? '',
      tphCode: json['tph_code'] ?? '',
      tphLatitude: json['tph_latitude'] ?? '',
      tphLongitude: json['tph_longitude'] ?? '',
      tphPalmTotal: json['tph_palm_total'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tph_id": tphId,
      "tph_company_code": tphCompanyCode,
      "tph_estate_code": tphEstateCode,
      "tph_division_code": tphDivisionCode,
      "tph_block_code": tphBlockCode,
      "tph_section_code": tphSectionCode,
      "tph_code": tphCode,
      "tph_latitude": tphLatitude,
      "tph_longitude": tphLongitude,
      "tph_palm_total": tphPalmTotal,
    };
  }
}

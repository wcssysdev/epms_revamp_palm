import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/oph_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'oph_card_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mOphCardAnnotation)
class OphCardModel implements OphCard {
  @override
  @HiveField(0)
  final String ophCardId;
  @override
  @HiveField(1)
  final String ophCardDivision;

  OphCardModel({required this.ophCardId, required this.ophCardDivision});

  factory OphCardModel.fromJson(Map<String, dynamic> json) {
    return OphCardModel(
      ophCardId: json['oph_card_id'] ?? '',
      ophCardDivision: json['oph_card_division'] ?? '',
    );
  }

  Map<String, dynamic> toJason() {
    return {'oph_card_id': ophCardId, 'oph_card_division': ophCardDivision};
  }
}

import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/spb_card.dart';
import 'package:hive/hive.dart';

part 'spb_card_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mSpbCardAnnotation)
class SpbCardModel implements SpbCard {
  @override
  @HiveField(0)
  final String fdnCardId;
  @override
  @HiveField(1)
  final String fdnCardDivision;

  SpbCardModel({required this.fdnCardId, required this.fdnCardDivision});

  factory SpbCardModel.fromJson(Map<String, dynamic> json) {
    return SpbCardModel(
      fdnCardId: json['fdn_card_id'],
      fdnCardDivision: json['fdn_card_division'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'fdn_card_id': fdnCardId, 'fdn_card_division': fdnCardDivision};
  }
}

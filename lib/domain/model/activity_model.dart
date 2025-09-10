// import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/activity.dart';
import 'package:hive/hive.dart';

part 'activity_model.g.dart';

@HiveType(typeId: GlobalAnnotationSchema.mActivityAnnotation)
class ActivityModel implements Activity {
  @override
  @HiveField(0)
  final int activityId;
  @override
  @HiveField(1)
  final String activityCode;
  @override
  @HiveField(2)
  final String activityName;
  @override
  @HiveField(3)
  final String activityUom;
  @override
  @HiveField(4)
  final String activityCostByBlock;
  @override
  @HiveField(5)
  final String activityCostByAuc;
  @override
  @HiveField(6)
  final String activityCostByOrderNumber;
  @override
  @HiveField(7)
  final String activityCostByCostCenter;
  @override
  @HiveField(8)
  final String activityBlockIsLc;
  @override
  @HiveField(9)
  final String activityBlockIsImmature;
  @override
  @HiveField(10)
  final String activityBlockIsMature;
  @override
  @HiveField(11)
  final String activityBlockIsScout;
  @override
  @HiveField(12)
  final String activityUomName;
  @override
  @HiveField(13)
  final String activityGroupCode;
  @override
  @HiveField(14)
  final String activityIsWbsRequired;

  ActivityModel({
    required this.activityId,
    required this.activityCode,
    required this.activityName,
    required this.activityUom,
    required this.activityCostByBlock,
    required this.activityCostByAuc,
    required this.activityCostByOrderNumber,
    required this.activityCostByCostCenter,
    required this.activityBlockIsLc,
    required this.activityBlockIsImmature,
    required this.activityBlockIsMature,
    required this.activityBlockIsScout,
    required this.activityUomName,
    required this.activityGroupCode,
    required this.activityIsWbsRequired,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      activityId: json['activity_id'] ?? 0,
      activityCode: json['activity_code'] ?? '',
      activityName: json['activity_name'] ?? '',
      activityUom: json['activity_uom'] ?? '',
      activityCostByBlock: json['activity_cost_by_block'] ?? '',
      activityCostByAuc: json['activity_cost_by_auc'] ?? '',
      activityCostByOrderNumber: json['activity_cost_by_order_number'] ?? '',
      activityCostByCostCenter: json['activity_cost_by_cost_center'] ?? '',
      activityBlockIsLc: json['activity_block_is_lc'] ?? '',
      activityBlockIsImmature: json['activity_block_is_immature'] ?? '',
      activityBlockIsMature: json['activity_block_is_mature'] ?? '',
      activityBlockIsScout: json['activity_block_is_scout'] ?? '',
      activityUomName: json['activity_uom_name'] ?? '',
      activityGroupCode: json['activity_group_code'] ?? '',
      activityIsWbsRequired: json['activity_is_wbs_required'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "activity_id": activityId,
      "activity_code": activityCode,
      "activity_name": activityName,
      "activity_uom": activityUom,
      "activity_cost_by_block": activityCostByBlock,
      "activity_cost_by_auc": activityCostByAuc,
      "activity_cost_by_order_number": activityCostByOrderNumber,
      "activity_cost_by_cost_center": activityCostByCostCenter,
      "activity_block_is_lc": activityBlockIsLc,
      "activity_block_is_immature": activityBlockIsImmature,
      "activity_block_is_mature": activityBlockIsMature,
      "activity_block_is_scout": activityBlockIsScout,
      "activity_uom_name": activityUomName,
      "activity_group_code": activityGroupCode,
      "activity_is_wbs_required": activityIsWbsRequired,
    };
  }
}

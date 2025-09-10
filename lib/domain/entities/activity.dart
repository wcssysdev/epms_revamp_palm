class Activity {
  final int activityId;
  final String activityCode;
  final String activityName;
  final String activityUom;
  final String activityCostByBlock;
  final String activityCostByAuc;
  final String activityCostByOrderNumber;
  final String activityCostByCostCenter;
  final String activityBlockIsLc;
  final String activityBlockIsImmature;
  final String activityBlockIsMature;
  final String activityBlockIsScout;
  final String activityUomName;
  final String activityGroupCode;
  final String activityIsWbsRequired;

  Activity({
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
}

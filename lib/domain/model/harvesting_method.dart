import 'package:hive/hive.dart';

part 'harvesting_method.g.dart';

@HiveType(typeId: 1)
class HarvestingMethod { // entity HarvestingMethod
  @HiveField(0)
  int mhmId;
  @HiveField(1)
  String mhmIndicator;
  @HiveField(2)
  String mhmAbbreviation;
  @HiveField(3)
  String mhmDescription;

  HarvestingMethod({
    required this.mhmId,
    required this.mhmIndicator,
    required this.mhmAbbreviation,
    required this.mhmDescription,
  });
}

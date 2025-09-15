class WorkType {
  final int workTypeId;
  final String workTypeCode;
  final String workTypeName;

  WorkType({
    required this.workTypeId,
    required this.workTypeCode,
    required this.workTypeName,
  });

  Map<String, dynamic> toJson() {
    return {
      'workTypeId': workTypeId,
      'workTypeCode': workTypeCode,
      'workTypeName': workTypeName,
    };
  }

  @override
  String toString() => toJson().toString();
}

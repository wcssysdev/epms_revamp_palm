class RecevingPoint {
  final int receivingPointId;
  final String receivingPointCode;

  RecevingPoint({
    required this.receivingPointId,
    required this.receivingPointCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'receivingPointId': receivingPointId,
      'receivingPointCode': receivingPointCode,
    };
  }

  @override
  String toString() => toJson().toString();
}

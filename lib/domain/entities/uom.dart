class Uom {
  final String uomId;
  final String uomCode;
  final String uomDesc;

  Uom({required this.uomId, required this.uomCode, required this.uomDesc});

  Map<String, dynamic> toJson() {
    return {'uomId': uomId, 'uomCode': uomCode, 'uomDesc': uomDesc};
  }

  @override
  String toString() => toJson().toString();
}

class Tph {
  final int tphId;
  final String tphCompanyCode;
  final String tphEstateCode;
  final String tphDivisionCode;
  final String tphBlockCode;
  final String tphSectionCode;
  final String tphCode;
  final String tphLatitude;
  final String tphLongitude;
  final String tphPalmTotal;

  Tph({
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

  Map<String, dynamic> toJson() {
    return {
      'tphId': tphId,
      'tphCompanyCode': tphCompanyCode,
      'tphEstateCode': tphEstateCode,
      'tphDivisionCode': tphDivisionCode,
      'tphBlockCode': tphBlockCode,
      'tphSectionCode': tphSectionCode,
      'tphCode': tphCode,
      'tphLatitude': tphLatitude,
      'tphLongitude': tphLongitude,
      'tphPalmTotal': tphPalmTotal,
    };
  }

  @override
  String toString() => toJson().toString();
}

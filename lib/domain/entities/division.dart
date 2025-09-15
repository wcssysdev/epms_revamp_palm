class Division {
  final int divisionId;
  final String divisionCompanyCode;
  final String divisionEstateCode;
  final String divisionCode;
  final String divisionName;

  Division({
    required this.divisionId,
    required this.divisionCompanyCode,
    required this.divisionEstateCode,
    required this.divisionCode,
    required this.divisionName,
  });

  Map<String, dynamic> toJson() {
    return {
      'divisionId': divisionId,
      'divisionCompanyCode': divisionCompanyCode,
      'divisionEstateCode': divisionEstateCode,
      'divisionCode': divisionCode,
      'divisionName': divisionName,
    };
  }

  @override
  String toString() => toJson().toString();
}

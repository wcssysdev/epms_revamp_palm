class Estate {
  final int estateId;
  final String estateCompanyCode;
  final String estateCode;
  final String estateName;
  final String estatePlantCode;

  Estate({
    required this.estateId,
    required this.estateCompanyCode,
    required this.estateCode,
    required this.estateName,
    required this.estatePlantCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'estateId': estateId,
      'estateCompanyCode': estateCompanyCode,
      'estateCode': estateCode,
      'estateName': estateName,
      'estatePlantCode': estatePlantCode,
    };
  }

  @override
  String toString() => toJson().toString();
}

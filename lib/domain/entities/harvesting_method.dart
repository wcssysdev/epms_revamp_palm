class HarvestingMethod {
  final int mhmId;
  final String mhmIndicator;
  final String mhmAbbreviation;
  final String mhmDescription;

  HarvestingMethod({
    required this.mhmId,
    required this.mhmIndicator,
    required this.mhmAbbreviation,
    required this.mhmDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      'mhmId': mhmId,
      'mhmIndicator': mhmIndicator,
      'mhmAbbreviation': mhmAbbreviation,
      'mhmDescription': mhmDescription,
    };
  }

  @override
  String toString() => toJson().toString();
}

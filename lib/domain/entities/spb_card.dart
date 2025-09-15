class SpbCard {
  final String fdnCardId;
  final String fdnCardDivision;

  SpbCard({required this.fdnCardId, required this.fdnCardDivision});

  Map<String, dynamic> toJson() {
    return {'fdnCardId': fdnCardId, 'fdnCardDivision': fdnCardDivision};
  }

  @override
  String toString() => toJson().toString();
}

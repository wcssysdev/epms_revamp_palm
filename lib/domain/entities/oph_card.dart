class OphCard {
  final String ophCardId;
  final String ophCardDivision;

  OphCard({required this.ophCardId, required this.ophCardDivision});

  Map<String, dynamic> toJson() {
    return {'ophCardId': ophCardId, 'ophCardDivision': ophCardDivision};
  }

  @override
  String toString() => toJson().toString();
}

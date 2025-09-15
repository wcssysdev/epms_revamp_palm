class VraType {
  final String vraObjectType;
  final int typeId;

  VraType({required this.vraObjectType, required this.typeId});

  Map<String, dynamic> toJson() {
    return {'vraObjectType': vraObjectType, 'typeId': typeId};
  }

  @override
  String toString() => toJson().toString();
}

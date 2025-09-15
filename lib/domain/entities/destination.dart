class Destination {
  final int destinationId;
  final String destinationCode;
  final String destinationName;

  Destination({
    required this.destinationId,
    required this.destinationCode,
    required this.destinationName,
  });

  Map<String, dynamic> toJson() {
    return {
      'destinationId': destinationId,
      'destinationCode': destinationCode,
      'destinationName': destinationName,
    };
  }

  @override
  String toString() => toJson().toString();
}

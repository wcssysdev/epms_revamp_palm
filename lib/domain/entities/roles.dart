class Roles {
  final int userId;
  final String userRoles;

  Roles({required this.userId, required this.userRoles});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'userRoles': userRoles};
  }

  @override
  String toString() => toJson().toString();
}

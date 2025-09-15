class LoginResult {
  final bool isSuccess;
  final String userRole;

  LoginResult({required this.isSuccess, required this.userRole});

  Map<String, dynamic> toJson() {
    return {'isSuccess': isSuccess, 'userRole': userRole};
  }

  @override
  String toString() => toJson().toString();
}

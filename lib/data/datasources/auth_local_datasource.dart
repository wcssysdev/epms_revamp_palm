import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:epms_tech/domain/entities/login_result.dart';
import 'package:hive/hive.dart';

class AuthLocalDatasource {
  static const _boxName = 'app_settings';
  static const _ipKey = 'ip_address';
  static const _fdnWithoutCp = 'fdn_without_cp';
  static const _isAuthenticated = 'is_authenticated';
  static const _userRole = 'user_role';

  Future<dynamic> saveIpAddress(String ip, bool fdnWithoutCp) async {
    var box = await Hive.openBox(_boxName);
    await box.put(_ipKey, ip);
    await box.put(_fdnWithoutCp, fdnWithoutCp);
    return true;
  }

  Future<String?> getIpAddress() async {
    var box = await Hive.openBox(_boxName);
    final value = box.get(_ipKey);
    if (value is String && value.trim().isNotEmpty) {
      return value.trim();
    }
    return null;
  }

  Future<bool?> getFdnWithoutCp() async {
    var box = await Hive.openBox(_boxName);
    final value = box.get(_fdnWithoutCp);
    if (value is bool && value != null) {
      return value;
    }
    return true;
  }

  Future<bool> saveUserRoleAuthed(bool isAuthenticated, String userRole) async {
    var box = await Hive.openBox(_boxName);
    await box.put(_isAuthenticated, isAuthenticated);
    await box.put(_userRole, userRole);
    return true;
  }

  Future<LoginResult> getUserRolesAuthed() async {
    var box = await Hive.openBox(_boxName);
    final isAuthenticated = box.get(_isAuthenticated);
    final userRoles = box.get(_userRole);
    return LoginResult(isSuccess: isAuthenticated, userRole: userRoles);
  }

}

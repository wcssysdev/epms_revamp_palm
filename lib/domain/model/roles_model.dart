import 'package:epms_tech/core/constants/global_annotation_schema.dart';
import 'package:epms_tech/domain/entities/roles.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'roles_model.g.dart';
@HiveType(typeId: GlobalAnnotationSchema.mRolesAnnotation)
class RolesModel implements Roles{
  @override
  @HiveField(0)
  final int userId;
  @override
  @HiveField(1)
  final String userRoles;

  RolesModel ({
    required this.userId,
    required this.userRoles,
  });

  factory RolesModel.fromJson(Map<String, dynamic> json) {
    return RolesModel(userId: json['user_id'], userRoles: json['user_roles']);
  }

  Map<String, dynamic> toJson() {
    return {"user_id": userId, "user_roles": userRoles};
  }
} 
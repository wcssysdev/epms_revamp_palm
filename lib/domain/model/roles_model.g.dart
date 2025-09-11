// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RolesModelAdapter extends TypeAdapter<RolesModel> {
  @override
  final int typeId = 28;

  @override
  RolesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RolesModel(
      userId: fields[0] as int,
      userRoles: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RolesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userRoles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RolesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

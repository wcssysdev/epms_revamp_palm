// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_assignment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAssignmentModelAdapter extends TypeAdapter<UserAssignmentModel> {
  @override
  final int typeId = 21;

  @override
  UserAssignmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAssignmentModel(
      mandorId: fields[0] as int,
      profileName: fields[1] as String,
      mandorEmployeeCode: fields[2] as String,
      mandorEmployeeName: fields[3] as String,
      employeeCode: fields[4] as String,
      employeeName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserAssignmentModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mandorId)
      ..writeByte(1)
      ..write(obj.profileName)
      ..writeByte(2)
      ..write(obj.mandorEmployeeCode)
      ..writeByte(3)
      ..write(obj.mandorEmployeeName)
      ..writeByte(4)
      ..write(obj.employeeCode)
      ..writeByte(5)
      ..write(obj.employeeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAssignmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

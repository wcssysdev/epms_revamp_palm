// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigModelAdapter extends TypeAdapter<ConfigModel> {
  @override
  final int typeId = 26;

  @override
  ConfigModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigModel(
      configId: fields[0] as int,
      companyCode: fields[1] as String,
      companyName: fields[2] as String,
      profileCode: fields[3] as String,
      profileName: fields[4] as String,
      estateCode: fields[5] as String,
      estateName: fields[6] as String,
      plantCode: fields[7] as String,
      attendanceDefaultValue: fields[8] as String,
      integrationType: fields[9] as String,
      attendanceNormalDefaultValue: fields[10] as String,
      systemIsPalm: fields[11] as String,
      dailyOvertimeMaxLimit: fields[12] as String,
      additionalSettings: fields[13] as String,
      attendanceUnattenddeValue: fields[14] as String,
      attendanceUnattendedValue: fields[15] as String?,
      token: fields[16] as String,
      employeeCode: fields[17] as String,
      employeeName: fields[18] as String,
      userId: fields[19] as int,
      allowedAttendanceCodeForWorkAssignment:
          (fields[20] as List).cast<AllowedAttendanceCodeModel>(),
      loginDeviceId: fields[21] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.configId)
      ..writeByte(1)
      ..write(obj.companyCode)
      ..writeByte(2)
      ..write(obj.companyName)
      ..writeByte(3)
      ..write(obj.profileCode)
      ..writeByte(4)
      ..write(obj.profileName)
      ..writeByte(5)
      ..write(obj.estateCode)
      ..writeByte(6)
      ..write(obj.estateName)
      ..writeByte(7)
      ..write(obj.plantCode)
      ..writeByte(8)
      ..write(obj.attendanceDefaultValue)
      ..writeByte(9)
      ..write(obj.integrationType)
      ..writeByte(10)
      ..write(obj.attendanceNormalDefaultValue)
      ..writeByte(11)
      ..write(obj.systemIsPalm)
      ..writeByte(12)
      ..write(obj.dailyOvertimeMaxLimit)
      ..writeByte(13)
      ..write(obj.additionalSettings)
      ..writeByte(14)
      ..write(obj.attendanceUnattenddeValue)
      ..writeByte(15)
      ..write(obj.attendanceUnattendedValue)
      ..writeByte(16)
      ..write(obj.token)
      ..writeByte(17)
      ..write(obj.employeeCode)
      ..writeByte(18)
      ..write(obj.employeeName)
      ..writeByte(19)
      ..write(obj.userId)
      ..writeByte(20)
      ..write(obj.allowedAttendanceCodeForWorkAssignment)
      ..writeByte(21)
      ..write(obj.loginDeviceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AllowedAttendanceCodeModelAdapter
    extends TypeAdapter<AllowedAttendanceCodeModel> {
  @override
  final int typeId = 27;

  @override
  AllowedAttendanceCodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllowedAttendanceCodeModel(
      allowedAttendanceCode: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AllowedAttendanceCodeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.allowedAttendanceCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllowedAttendanceCodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

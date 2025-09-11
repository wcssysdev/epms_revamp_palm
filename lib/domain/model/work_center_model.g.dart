// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_center_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkCenterModelAdapter extends TypeAdapter<WorkCenterModel> {
  @override
  final int typeId = 5;

  @override
  WorkCenterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkCenterModel(
      workCenterId: fields[0] as int,
      workCenterCode: fields[1] as String,
      workCenterName: fields[2] as String,
      workCenterCompanyCode: fields[3] as String,
      workCenterPlantCode: fields[4] as String,
      workCenterEstateCode: fields[5] as String,
      workCenterDivisionCode: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkCenterModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.workCenterId)
      ..writeByte(1)
      ..write(obj.workCenterCode)
      ..writeByte(2)
      ..write(obj.workCenterName)
      ..writeByte(3)
      ..write(obj.workCenterCompanyCode)
      ..writeByte(4)
      ..write(obj.workCenterPlantCode)
      ..writeByte(5)
      ..write(obj.workCenterEstateCode)
      ..writeByte(6)
      ..write(obj.workCenterDivisionCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkCenterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

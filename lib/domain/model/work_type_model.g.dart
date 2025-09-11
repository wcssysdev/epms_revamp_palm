// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkTypeModelAdapter extends TypeAdapter<WorkTypeModel> {
  @override
  final int typeId = 4;

  @override
  WorkTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkTypeModel(
      workTypeId: fields[0] as int,
      workTypeCode: fields[1] as String,
      workTypeName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkTypeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.workTypeId)
      ..writeByte(1)
      ..write(obj.workTypeCode)
      ..writeByte(2)
      ..write(obj.workTypeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

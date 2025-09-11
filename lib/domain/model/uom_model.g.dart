// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uom_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UomModelAdapter extends TypeAdapter<UomModel> {
  @override
  final int typeId = 25;

  @override
  UomModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UomModel(
      uomId: fields[0] as String,
      uomCode: fields[1] as String,
      uomDesc: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UomModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uomId)
      ..writeByte(1)
      ..write(obj.uomCode)
      ..writeByte(2)
      ..write(obj.uomDesc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UomModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

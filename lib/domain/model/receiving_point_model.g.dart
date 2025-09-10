// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiving_point_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReceivingPointModelAdapter extends TypeAdapter<ReceivingPointModel> {
  @override
  final int typeId = 17;

  @override
  ReceivingPointModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReceivingPointModel(
      receivingPointId: fields[0] as int,
      receivingPointCode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReceivingPointModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.receivingPointId)
      ..writeByte(1)
      ..write(obj.receivingPointCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceivingPointModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

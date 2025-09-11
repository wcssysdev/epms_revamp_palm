// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DestinationModelAdapter extends TypeAdapter<DestinationModel> {
  @override
  final int typeId = 19;

  @override
  DestinationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DestinationModel(
      destinationId: fields[0] as int,
      destinationCode: fields[1] as String,
      destinationName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DestinationModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.destinationId)
      ..writeByte(1)
      ..write(obj.destinationCode)
      ..writeByte(2)
      ..write(obj.destinationName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

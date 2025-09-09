// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harvesting_method_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HarvestingMethodModelAdapter extends TypeAdapter<HarvestingMethodModel> {
  @override
  final int typeId = 2;

  @override
  HarvestingMethodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HarvestingMethodModel(
      mhmId: fields[0] as int,
      mhmIndicator: fields[1] as String,
      mhmAbbreviation: fields[2] as String,
      mhmDescription: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HarvestingMethodModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mhmId)
      ..writeByte(1)
      ..write(obj.mhmIndicator)
      ..writeByte(2)
      ..write(obj.mhmAbbreviation)
      ..writeByte(3)
      ..write(obj.mhmDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarvestingMethodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

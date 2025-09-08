// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harvesting_method.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HarvestingMethodAdapter extends TypeAdapter<HarvestingMethod> {
  @override
  final int typeId = 1;

  @override
  HarvestingMethod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HarvestingMethod(
      mhmId: fields[0] as int,
      mhmIndicator: fields[1] as String,
      mhmAbbreviation: fields[2] as String,
      mhmDescription: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HarvestingMethod obj) {
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
      other is HarvestingMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

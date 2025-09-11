// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spb_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpbCardModelAdapter extends TypeAdapter<SpbCardModel> {
  @override
  final int typeId = 24;

  @override
  SpbCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpbCardModel(
      fdnCardId: fields[0] as String,
      fdnCardDivision: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpbCardModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fdnCardId)
      ..writeByte(1)
      ..write(obj.fdnCardDivision);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpbCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oph_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OphCardModelAdapter extends TypeAdapter<OphCardModel> {
  @override
  final int typeId = 23;

  @override
  OphCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OphCardModel(
      ophCardId: fields[0] as String,
      ophCardDivision: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OphCardModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ophCardId)
      ..writeByte(1)
      ..write(obj.ophCardDivision);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OphCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

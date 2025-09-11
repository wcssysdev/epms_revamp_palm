// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tph_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TphModelAdapter extends TypeAdapter<TphModel> {
  @override
  final int typeId = 22;

  @override
  TphModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TphModel(
      tphId: fields[0] as int,
      tphCompanyCode: fields[1] as String,
      tphEstateCode: fields[2] as String,
      tphDivisionCode: fields[3] as String,
      tphBlockCode: fields[4] as String,
      tphSectionCode: fields[5] as String,
      tphCode: fields[6] as String,
      tphLatitude: fields[7] as String,
      tphLongitude: fields[8] as String,
      tphPalmTotal: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TphModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.tphId)
      ..writeByte(1)
      ..write(obj.tphCompanyCode)
      ..writeByte(2)
      ..write(obj.tphEstateCode)
      ..writeByte(3)
      ..write(obj.tphDivisionCode)
      ..writeByte(4)
      ..write(obj.tphBlockCode)
      ..writeByte(5)
      ..write(obj.tphSectionCode)
      ..writeByte(6)
      ..write(obj.tphCode)
      ..writeByte(7)
      ..write(obj.tphLatitude)
      ..writeByte(8)
      ..write(obj.tphLongitude)
      ..writeByte(9)
      ..write(obj.tphPalmTotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TphModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

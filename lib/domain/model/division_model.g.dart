// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DivisionModelAdapter extends TypeAdapter<DivisionModel> {
  @override
  final int typeId = 8;

  @override
  DivisionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DivisionModel(
      divisionId: fields[0] as int,
      divisionCompanyCode: fields[1] as String,
      divisionEstateCode: fields[2] as String,
      divisionCode: fields[3] as String,
      divisionName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DivisionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.divisionId)
      ..writeByte(1)
      ..write(obj.divisionCompanyCode)
      ..writeByte(2)
      ..write(obj.divisionEstateCode)
      ..writeByte(3)
      ..write(obj.divisionCode)
      ..writeByte(4)
      ..write(obj.divisionName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DivisionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

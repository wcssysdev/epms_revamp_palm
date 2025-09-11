// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EstateModelAdapter extends TypeAdapter<EstateModel> {
  @override
  final int typeId = 7;

  @override
  EstateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EstateModel(
      estateId: fields[0] as int,
      estateCompanyCode: fields[1] as String,
      estateCode: fields[2] as String,
      estateName: fields[3] as String,
      estatePlantCode: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EstateModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.estateId)
      ..writeByte(1)
      ..write(obj.estateCompanyCode)
      ..writeByte(2)
      ..write(obj.estateCode)
      ..writeByte(3)
      ..write(obj.estateName)
      ..writeByte(4)
      ..write(obj.estatePlantCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

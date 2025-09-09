// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CropTypeModelAdapter extends TypeAdapter<CropTypeModel> {
  @override
  final int typeId = 1;

  @override
  CropTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CropTypeModel(
      cropTypeCode: fields[0] as String,
      cropTypeName: fields[1] as String,
      description: fields[2] as String,
      canHarvest: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CropTypeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cropTypeCode)
      ..writeByte(1)
      ..write(obj.cropTypeName)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.canHarvest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CropTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

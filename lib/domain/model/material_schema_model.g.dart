// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_schema_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialSchemaModelAdapter extends TypeAdapter<MaterialSchemaModel> {
  @override
  final int typeId = 20;

  @override
  MaterialSchemaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaterialSchemaModel(
      materialId: fields[0] as int,
      materialCode: fields[1] as String,
      materialName: fields[2] as String,
      materialUom: fields[3] as String,
      materialPlantCode: fields[4] as String,
      materialSloc: fields[5] as String,
      materialBatch: fields[6] as String,
      materialGroup: fields[7] as String,
      materialType: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MaterialSchemaModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.materialId)
      ..writeByte(1)
      ..write(obj.materialCode)
      ..writeByte(2)
      ..write(obj.materialName)
      ..writeByte(3)
      ..write(obj.materialUom)
      ..writeByte(4)
      ..write(obj.materialPlantCode)
      ..writeByte(5)
      ..write(obj.materialSloc)
      ..writeByte(6)
      ..write(obj.materialBatch)
      ..writeByte(7)
      ..write(obj.materialGroup)
      ..writeByte(8)
      ..write(obj.materialType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialSchemaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

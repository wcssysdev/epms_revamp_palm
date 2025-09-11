// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_block_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterBlockModelAdapter extends TypeAdapter<MasterBlockModel> {
  @override
  final int typeId = 9;

  @override
  MasterBlockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MasterBlockModel(
      blockId: fields[0] as int,
      blockCompanyCode: fields[1] as String,
      blockEstateCode: fields[2] as String,
      blockDivisionCode: fields[3] as String,
      blockCode: fields[4] as String,
      blockName: fields[5] as String,
      blockHectarage: fields[6] as String,
      blockState: fields[7] as String,
      blockCropType: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MasterBlockModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.blockId)
      ..writeByte(1)
      ..write(obj.blockCompanyCode)
      ..writeByte(2)
      ..write(obj.blockEstateCode)
      ..writeByte(3)
      ..write(obj.blockDivisionCode)
      ..writeByte(4)
      ..write(obj.blockCode)
      ..writeByte(5)
      ..write(obj.blockName)
      ..writeByte(6)
      ..write(obj.blockHectarage)
      ..writeByte(7)
      ..write(obj.blockState)
      ..writeByte(8)
      ..write(obj.blockCropType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterBlockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

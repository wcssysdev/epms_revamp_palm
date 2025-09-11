// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vra_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VraTypeModelAdapter extends TypeAdapter<VraTypeModel> {
  @override
  final int typeId = 17;

  @override
  VraTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VraTypeModel(
      vraObjectType: fields[0] as String,
      typeId: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VraTypeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.vraObjectType)
      ..writeByte(1)
      ..write(obj.typeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VraTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

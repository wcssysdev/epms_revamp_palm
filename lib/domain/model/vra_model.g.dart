// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vra_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VraModelAdapter extends TypeAdapter<VraModel> {
  @override
  final int typeId = 16;

  @override
  VraModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VraModel(
      vraId: fields[0] as int,
      vraLicenseNumber: fields[1] as String,
      vraOrderNumber: fields[2] as String,
      vraEquipmentCode: fields[3] as String,
      vraObjectType: fields[4] as String,
      vraPlantCode: fields[5] as String,
      vraMeasUnit: fields[6] as String,
      vraMeasPoint: fields[7] as String,
      vraEquipment: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VraModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.vraId)
      ..writeByte(1)
      ..write(obj.vraLicenseNumber)
      ..writeByte(2)
      ..write(obj.vraOrderNumber)
      ..writeByte(3)
      ..write(obj.vraEquipmentCode)
      ..writeByte(4)
      ..write(obj.vraObjectType)
      ..writeByte(5)
      ..write(obj.vraPlantCode)
      ..writeByte(6)
      ..write(obj.vraMeasUnit)
      ..writeByte(7)
      ..write(obj.vraMeasPoint)
      ..writeByte(8)
      ..write(obj.vraEquipment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VraModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityModelAdapter extends TypeAdapter<ActivityModel> {
  @override
  final int typeId = 13;

  @override
  ActivityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityModel(
      activityId: fields[0] as int,
      activityCode: fields[1] as String,
      activityName: fields[2] as String,
      activityUom: fields[3] as String,
      activityCostByBlock: fields[4] as String,
      activityCostByAuc: fields[5] as String,
      activityCostByOrderNumber: fields[6] as String,
      activityCostByCostCenter: fields[7] as String,
      activityBlockIsLc: fields[8] as String,
      activityBlockIsImmature: fields[9] as String,
      activityBlockIsMature: fields[10] as String,
      activityBlockIsScout: fields[11] as String,
      activityUomName: fields[12] as String,
      activityGroupCode: fields[13] as String,
      activityIsWbsRequired: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.activityId)
      ..writeByte(1)
      ..write(obj.activityCode)
      ..writeByte(2)
      ..write(obj.activityName)
      ..writeByte(3)
      ..write(obj.activityUom)
      ..writeByte(4)
      ..write(obj.activityCostByBlock)
      ..writeByte(5)
      ..write(obj.activityCostByAuc)
      ..writeByte(6)
      ..write(obj.activityCostByOrderNumber)
      ..writeByte(7)
      ..write(obj.activityCostByCostCenter)
      ..writeByte(8)
      ..write(obj.activityBlockIsLc)
      ..writeByte(9)
      ..write(obj.activityBlockIsImmature)
      ..writeByte(10)
      ..write(obj.activityBlockIsMature)
      ..writeByte(11)
      ..write(obj.activityBlockIsScout)
      ..writeByte(12)
      ..write(obj.activityUomName)
      ..writeByte(13)
      ..write(obj.activityGroupCode)
      ..writeByte(14)
      ..write(obj.activityIsWbsRequired);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

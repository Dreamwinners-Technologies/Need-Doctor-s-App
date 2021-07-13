// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DrugDetails.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrugDetailsAdapter extends TypeAdapter<DrugDetails> {
  @override
  final int typeId = 0;

  @override
  DrugDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrugDetails(
      administration: fields[0] as String,
      adultDose: fields[1] as String,
      brandName: fields[2] as String,
      childDose: fields[3] as String,
      contraindications: fields[4] as String,
      drugId: fields[5] as String,
      generic: fields[6] as String,
      indications: fields[7] as String,
      interaction: fields[8] as String,
      modeOfAction: fields[9] as String,
      name: fields[10] as String,
      packSize: fields[11] as String,
      packSizeAndPrice: fields[12] as String,
      precautionsAndWarnings: fields[13] as String,
      pregnancyAndLactation: fields[14] as String,
      renalDose: fields[15] as String,
      sideEffects: fields[16] as String,
      therapeuticClass: fields[17] as String,
      type: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DrugDetails obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.administration)
      ..writeByte(1)
      ..write(obj.adultDose)
      ..writeByte(2)
      ..write(obj.brandName)
      ..writeByte(3)
      ..write(obj.childDose)
      ..writeByte(4)
      ..write(obj.contraindications)
      ..writeByte(5)
      ..write(obj.drugId)
      ..writeByte(6)
      ..write(obj.generic)
      ..writeByte(7)
      ..write(obj.indications)
      ..writeByte(8)
      ..write(obj.interaction)
      ..writeByte(9)
      ..write(obj.modeOfAction)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.packSize)
      ..writeByte(12)
      ..write(obj.packSizeAndPrice)
      ..writeByte(13)
      ..write(obj.precautionsAndWarnings)
      ..writeByte(14)
      ..write(obj.pregnancyAndLactation)
      ..writeByte(15)
      ..write(obj.renalDose)
      ..writeByte(16)
      ..write(obj.sideEffects)
      ..writeByte(17)
      ..write(obj.therapeuticClass)
      ..writeByte(18)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrugDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

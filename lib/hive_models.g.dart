// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyHiveAdapter extends TypeAdapter<CompanyHive> {
  @override
  final int typeId = 0;

  @override
  CompanyHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyHive(
      name: fields[0] as String,
      city: fields[1] as String,
      branches: (fields[2] as List).cast<BranchHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, CompanyHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.branches);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BranchHiveAdapter extends TypeAdapter<BranchHive> {
  @override
  final int typeId = 1;

  @override
  BranchHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchHive(
      branchName: fields[0] as String,
      branchCity: fields[1] as String,
      branchCode: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BranchHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.branchName)
      ..writeByte(1)
      ..write(obj.branchCity)
      ..writeByte(2)
      ..write(obj.branchCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

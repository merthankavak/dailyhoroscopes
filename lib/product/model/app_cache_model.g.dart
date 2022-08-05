// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppCacheModelAdapter extends TypeAdapter<AppCacheModel> {
  @override
  final int typeId = 1;

  @override
  AppCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppCacheModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      birthDate: fields[2] as String?,
      isFirstInit: fields[3] == null ? true : fields[3] as bool?,
      horoscopeSign: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppCacheModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.birthDate)
      ..writeByte(3)
      ..write(obj.isFirstInit)
      ..writeByte(4)
      ..write(obj.horoscopeSign);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

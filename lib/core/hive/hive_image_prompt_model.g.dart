// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_image_prompt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveImagePromptModelAdapter extends TypeAdapter<HiveImagePromptModel> {
  @override
  final int typeId = 2;

  @override
  HiveImagePromptModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveImagePromptModel(
      title: fields[0] as String?,
      date: fields[1] as DateTime?,
      bytes: fields[2] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveImagePromptModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.bytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveImagePromptModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

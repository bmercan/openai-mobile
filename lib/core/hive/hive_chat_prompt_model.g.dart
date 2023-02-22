// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_chat_prompt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveChatPromptModelAdapter extends TypeAdapter<HiveChatPromptModel> {
  @override
  final int typeId = 1;

  @override
  HiveChatPromptModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveChatPromptModel(
      title: fields[0] as String?,
      date: fields[1] as DateTime?,
      chat: (fields[2] as List?)?.cast<ChatPromptModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveChatPromptModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.chat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveChatPromptModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_prompt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatPromptModelAdapter extends TypeAdapter<ChatPromptModel> {
  @override
  final int typeId = 0;

  @override
  ChatPromptModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatPromptModel(
      text: fields[0] as String?,
      sender: fields[1] as String?,
      date: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ChatPromptModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.sender)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatPromptModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

import 'package:hive_flutter/hive_flutter.dart';

part 'chat_prompt_model.g.dart';

@HiveType(typeId: 0)
class ChatPromptModel {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? sender;
  @HiveField(2)
  DateTime? date;
  ChatPromptModel({this.text, this.sender, this.date});
}

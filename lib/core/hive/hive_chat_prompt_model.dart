import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'chat_prompt_model.dart';
part 'hive_chat_prompt_model.g.dart';

@HiveType(typeId: 1)
class HiveChatPromptModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  List<ChatPromptModel>? chat;
  HiveChatPromptModel({this.title, this.date, this.chat});
}

import 'package:flutter/material.dart';

import '../../../../core/hive/hive_chat_prompt_model.dart';
import '../../home/widget/chatbubble.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({Key? key, required this.model}) : super(key: key);
  final HiveChatPromptModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title!),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: model.chat!.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatBubble(
              text: "${model.chat![index].text}",
              sender: "${model.chat![index].sender}");
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/hive/hive_chat_prompt_model.dart';
import '../../../../core/services/db_service.dart';
import '../../../../global/features.dart';
import 'historydetails.dart';

class GPTHistoryView extends StatelessWidget {
  const GPTHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: context.watch<LocalDBService>().chatHistory.length,
        itemBuilder: (BuildContext context, int index) {
          var prompt = context.watch<LocalDBService>().chatHistory;
          HiveChatPromptModel promptModel = prompt.values.toList()[index];
          var promptId = prompt.keys.toList()[index];
          return ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryDetails(model: promptModel))),
            title: Text(
              promptModel.title!,
            ),
            subtitle: Text(
              promptModel.chat!.last.text!,
            ),
            trailing: IconButton(
                onPressed: () {
                  context
                      .read<LocalDBService>()
                      .deletePrompt(feature: Features.CHAT_GPT, key: promptId);
                },
                icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}

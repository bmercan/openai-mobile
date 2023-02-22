import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/hive/hive_image_prompt_model.dart';
import '../../../../core/services/db_service.dart';
import '../../../../global/features.dart';
import 'historydetails.dart';

class DallEHistoryView extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  DallEHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: context.watch<LocalDBService>().imageHistory.length,
        itemBuilder: (BuildContext context, int index) {
          var prompt = context.watch<LocalDBService>().imageHistory;
          HiveImagePromptModel promptModel = prompt.values.toList()[index];
          var promptId = prompt.keys.toList()[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: UniqueKey(),
            onDismissed: (direction) {
              context
                  .read<LocalDBService>()
                  .deletePrompt(feature: Features.DALL_E_2, key: promptId);
            },
            background: Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DallEHistoryDetails(
                            model: promptModel, promptId: promptId)));
              },
              leading: Hero(
                  tag: promptModel.bytes!,
                  child: Image.memory(promptModel.bytes!)),
              title: Text(promptModel.title!),
              subtitle: Text(promptModel.date.toString()),
            ),
          );
        },
      ),
    );
  }
}

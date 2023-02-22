import 'package:flutter/material.dart';
import '../../../../core/hive/hive_image_prompt_model.dart';

class DallEHistoryDetails extends StatelessWidget {
  const DallEHistoryDetails(
      {Key? key, required this.model, required this.promptId})
      : super(key: key);
  final HiveImagePromptModel model;
  final dynamic promptId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(model.title!),
            Text(model.date.toString(),
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      body: Center(
          child: Hero(tag: model.bytes!, child: Image.memory(model.bytes!))),
    );
  }
}

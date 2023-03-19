import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/dalle_prompt_service.dart';
import '../../../../global/constants.dart';

class PromptImageWidget extends StatelessWidget {
  const PromptImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<DallEPromptService>().image != null &&
            !context.watch<DallEPromptService>().isLoading
        ? Padding(
            padding: const MarginConstant.all(),
            child: Image.memory(context.read<DallEPromptService>().image!),
          )
        : Column(
            children: [
              Text(
                "DALL-E 2",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Type your PROMPT"),
                    const TextSpan(text: "\ne.g. "),
                    TextSpan(
                        text: "A cute baby sea otter",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * .3,
                  child: context.watch<DallEPromptService>().isLoading
                      ? const LinearProgressIndicator()
                      : const SizedBox()),
            ],
          );
  }
}

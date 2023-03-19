import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../core/services/dalle_prompt_service.dart';
import '../../../../global/constants.dart';
import '../widget/image.dart';

class DallEHomeView extends StatelessWidget {
  DallEHomeView({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PromptImageWidget(),
              Padding(
                padding: const PaddingConstant.all(),
                child: TextField(
                  enabled: !context.watch<DallEPromptService>().isLoading,
                  controller: _controller,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Prompt",
                      suffixIcon: IconButton(
                          onPressed: _controller.clear,
                          icon: const Icon(Icons.close))),
                ),
              ),
              ElevatedButton(
                  onPressed:
                      context.watch<DallEPromptService>().isLoading == false
                          ? () => context
                              .read<DallEPromptService>()
                              .generateNewImage(prompt: _controller.text)
                          : null,
                  child: const Text("Generate"))
            ],
          ),
        ),
      ),
    );
  }
}

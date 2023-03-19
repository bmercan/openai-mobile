import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_gpt/core/services/chatgpt_prompt_service.dart';
import 'package:mobile_gpt/features/chatgpt/save/view/saveview.dart';
import 'package:provider/provider.dart';

import '../widget/chatbubble.dart';

class GPTHomeView extends StatelessWidget {
  GPTHomeView({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        tooltip: "Save",
        onPressed: () {
          if (context.read<ChatGPTPromptService>().chat.isNotEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SaveView()));
          }
        },
        child: Icon(
          Icons.save,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: context.watch<ChatGPTPromptService>().chat.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatBubble(
                        text: context
                            .watch<ChatGPTPromptService>()
                            .chat[index]
                            .text!,
                        sender: context
                            .watch<ChatGPTPromptService>()
                            .chat[index]
                            .sender!);
                  },
                ),
                context.watch<ChatGPTPromptService>().responding
                    ? const CupertinoActivityIndicator()
                    : const SizedBox()
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: "Enter Prompt"),
              )),
              IconButton(
                  onPressed: () {
                    context
                        .read<ChatGPTPromptService>()
                        .sendPrompt(prompt: _controller.text);
                    /* context.read<ChatGPTPromptService>().sendNewTextToChatGPT(
                        text: _controller.text, sender: "user"); */
                    _controller.text = "";
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

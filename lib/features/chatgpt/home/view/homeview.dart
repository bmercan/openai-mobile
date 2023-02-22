import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/db_service.dart';
import '../widget/chatbubble.dart';

class GPTHomeView extends StatelessWidget {
  GPTHomeView({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: context.watch<LocalDBService>().chat.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                    text: context.watch<LocalDBService>().chat[index].text!,
                    sender:
                        context.watch<LocalDBService>().chat[index].sender!);
              },
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
                    context.read<LocalDBService>().sendNewTextToChatGPT(
                        text: _controller.text, sender: "Chat-GPT");
                    _controller.text = "";
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.red)),
              IconButton(
                  onPressed: () {
                    context.read<LocalDBService>().sendNewTextToChatGPT(
                        text: _controller.text, sender: "Me");
                    _controller.text = "";
                  },
                  icon: Icon(Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.onSurface))
            ],
          ),
        ],
      ),
      /*   bottomSheet: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Enter Prompt"),
          )),
          IconButton(
              onPressed: () {
                context
                    .read<PromptClass>()
                    .sendNewPrompt(_controller.text, Sender.ME);
                _controller.text = "";
              },
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white))
        ],
      ), */
    );
  }
}

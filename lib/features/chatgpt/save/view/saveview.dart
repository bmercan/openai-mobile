import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/services/chatgpt_prompt_service.dart';
import '../../../../core/services/db_service.dart';
import 'package:intl/intl.dart';

class SaveView extends StatefulWidget {
  const SaveView({super.key});

  @override
  State<SaveView> createState() => _SaveViewState();
}

class _SaveViewState extends State<SaveView> {
  final LocalDBService _dbService = LocalDBService();
  final TextEditingController _controller = TextEditingController();
  bool clearChat = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(hintText: "Save This Chat As..."),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _dbService.saveChatHistory(
                    title: titleHandler(),
                    chat: context.read<ChatGPTPromptService>().chat);
                Navigator.pop(context);
              },
              child: const Text("Save")),
        ],
      ),
    );
  }

  String titleHandler() {
    return _controller.text != ""
        ? _controller.text
        : DateFormat('dd.MM.yyyy – kk:mm').format(DateTime.now());
  }
}

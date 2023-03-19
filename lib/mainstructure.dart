import 'package:flutter/material.dart';
import 'package:mobile_gpt/core/services/chatgpt_prompt_service.dart';
import 'package:mobile_gpt/features/chatgpt/history/view/historyview.dart';
import 'package:mobile_gpt/features/chatgpt/home/view/homeview.dart';
import 'package:provider/provider.dart';

import 'features/dall-e/history/view/historyview.dart';
import 'features/dall-e/home/view/homeview.dart';

class MainStructure extends StatefulWidget {
  const MainStructure({super.key, this.feature});
  final int? feature;
  @override
  State<MainStructure> createState() => _MainStructureState();
}

class _MainStructureState extends State<MainStructure> {
  List featurePages = [
    [DallEHomeView(), const DallEHistoryView()],
    [GPTHomeView(), const GPTHistoryView()]
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.feature == 0 ? "Dall-E 2" : "Chat-GPT"),
        actions: [
          widget.feature == 1
              ? IconButton(
                  onPressed: () {
                    context.read<ChatGPTPromptService>().clearChat();
                  },
                  icon: const Icon(Icons.cleaning_services),
                  tooltip: "Clear",
                )
              : const SizedBox()
        ],
      ),
      body: featurePages[widget.feature!][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}

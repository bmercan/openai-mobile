import 'package:flutter/material.dart';
import 'package:mobile_gpt/core/services/db_service.dart';
import 'package:mobile_gpt/core/services/dalle_prompt_service.dart';
import 'package:provider/provider.dart';

class FAB extends StatefulWidget {
  const FAB({super.key, required this.index});
  final int index;
  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.elasticIn,
      switchOutCurve: Curves.bounceIn,
      reverseDuration: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 300),
      child: widget.index != 0
          ? const SizedBox(
              key: Key("hide"),
            )
          : FloatingActionButton(
              tooltip: "Save",
              key: const Key("normal"),
              onPressed: () {
                context
                    .read<LocalDBService>()
                    .saveChatHistory(title: "Untitled");
              },
              child: const Icon(
                Icons.save,
              ),
            ),
    );
  }
}

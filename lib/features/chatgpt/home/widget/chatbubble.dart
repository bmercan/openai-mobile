import 'package:flutter/material.dart';

import '../../../../global/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.text, required this.sender});
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          sender == "user" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: sender == "user"
              ? const MarginConstant.chatBubbleUser()
              : const MarginConstant.chatBubbleGPT(),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: sender == "user"
                ? Theme.of(context).colorScheme.inverseSurface
                : ColorConstants.instance.kSecondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: sender == "user"
                  ? Theme.of(context).colorScheme.surface
                  : Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}

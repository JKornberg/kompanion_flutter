import 'package:bubble/bubble.dart';
import 'package:chatbot_flutter/src/models/chat_message.dart';
import 'package:chatbot_flutter/src/styles/base_styles.dart';
import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:chatbot_flutter/src/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatItem({Key? key, required this.chatMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseStyles.betweenMessagePadding,
      child: Bubble(
        margin: chatMessage.fromUser
            ? BubbleEdges.only(left: 100)
            : BubbleEdges.only(right: 100),
        radius: Radius.circular(15),
        nipRadius: 2,
        nip:
            chatMessage.fromUser ? BubbleNip.rightBottom : BubbleNip.leftBottom,
        alignment:
            chatMessage.fromUser ? Alignment.bottomRight : Alignment.bottomLeft,
        color: chatMessage.fromUser ? AppColors.primary : AppColors.accent,
        child: Padding(
          padding: BaseStyles.messagePadding,
          child: Text(
            chatMessage.text,
            style: chatMessage.fromUser
                ? TextStyles.userMessage
                : TextStyles.botMessage,
          ),
        ),
      ),
    );
  }
}

import 'package:chatbot_flutter/src/controllers/auth_controller.dart';
import 'package:chatbot_flutter/src/controllers/chat_controller.dart';
import 'package:chatbot_flutter/src/models/chat_message.dart';
import 'package:chatbot_flutter/src/screens/widgets/chat_item.dart';
import 'package:chatbot_flutter/src/screens/widgets/chat_text_field.dart';
import 'package:chatbot_flutter/src/screens/widgets/profile_menu.dart';
import 'package:chatbot_flutter/src/styles/base_styles.dart';
import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:chatbot_flutter/src/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Landing extends HookConsumerWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscription = ref.watch(userStreamProvider);

    return subscription.when(
        data: (currentUser) {
          final List<Widget> actions = [];
          if (currentUser == null) {
            actions.addAll([
              TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/register');
                  },
                  child: Text("Register", style: TextStyles.menuLabel)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text("Log In", style: TextStyles.menuLabel))
            ]);
          } else {
            actions.add(ProfileMenu(user: currentUser));
          }
          return Scaffold(
              backgroundColor: AppColors.dark,
              appBar: AppBar(
                title: const SelectableText("Kompanion"),
                actions: actions,
                backgroundColor: AppColors.background,
              ),
              body: pageBody(context));
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (e, stack) => Center(
              child: Text("Error: $e"),
            ));
  }

  Widget pageBody(BuildContext context) {
    bool isScreenWide =
        MediaQuery.of(context).size.width >= BaseStyles.mediumScreenBreakpoint;
    final messageController = useTextEditingController();
    final scrollController = useScrollController();
    onSubmit(String text, WidgetRef ref) {
      ref.read(chatHistoryNotifierProvider.notifier).addUserMessage(text);
      messageController.clear();
    }

    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).orientation);
    return Flex(
      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.background),
                color: AppColors.background),
            child: Column(
              children: [
                Expanded(child: Consumer(builder: (context, ref, child) {
                  final chatHistory = ref.watch(chatHistoryNotifierProvider);
                  return ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      controller: scrollController,
                      itemCount: chatHistory.length,
                      itemBuilder: (context, index) {
                        return ChatItem(chatMessage: chatHistory[index]);
                      });
                })),
                IntrinsicHeight(
                  child: Consumer(builder: (context, ref, child) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ChatTextField(
                            controller: messageController,
                            onSubmitted: (String text) {
                              onSubmit(text, ref);
                            },
                          ),
                        )),
                        IntrinsicHeight(
                          child: Material(
                            borderOnForeground: false,
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Ink(
                                  decoration: ShapeDecoration(
                                    color: AppColors.accent,
                                    shape: const CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: () {
                                      onSubmit(messageController.text, ref);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        )),
        const Expanded(child: const FlutterLogo()),
      ],
    );
  }
}

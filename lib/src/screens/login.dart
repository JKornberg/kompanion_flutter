import 'package:chatbot_flutter/src/controllers/auth_controller.dart';
import 'package:chatbot_flutter/src/screens/widgets/form_button.dart';
import 'package:chatbot_flutter/src/screens/widgets/form_text_field.dart';
import 'package:chatbot_flutter/src/screens/widgets/profile_menu.dart';
import 'package:chatbot_flutter/src/styles/base_styles.dart';
import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:chatbot_flutter/src/styles/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class Login extends HookWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _isMounted = useIsMounted();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: AppColors.dark,
                width: 500,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: SelectableText("Login to Kompanion",
                              style: TextStyles.title)),
                      FormTextField(
                          label: "Email", controller: _emailController),
                      FormTextField(
                          label: "Password",
                          obscureText: true,
                          controller: _passwordController),
                      Align(
                          alignment: Alignment.topRight,
                          child: Consumer(builder: (context, ref, child) {
                            return FormButton(
                              buttonText: "Log In",
                              onPressed: () async {
                                try {
                                  BuildContext ctx = context;
                                  final res = await ref
                                      .read(firebaseAuthProvider)
                                      .signInWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                  if (_isMounted()) {
                                    Navigator.of(ctx).pushNamed("/");
                                  }
                                } catch (e) {
                                  print("Error logging in");
                                }
                              },
                            );
                          })),
                      Center(
                        child: SelectableText.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyles.body),
                            TextSpan(
                                text: "Register Here",
                                style: TextStyles.hyperlink,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    // var uri = Uri.parse(
                                    //     "http://localhost:3000/register");
                                    // if (!await launchUrl(uri))
                                    //   throw 'Could not launch $uri';
                                    html.window.open("/register", "Register");
                                  }),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

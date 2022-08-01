import 'package:chatbot_flutter/src/routes.dart';
import 'package:chatbot_flutter/src/screens/landing.dart';
import 'package:chatbot_flutter/src/styles/base_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformApp();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  const PlatformApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Routes routes = Routes(ctx: context);
    return MaterialApp(
        theme: BaseStyles.theme,
        home: const Landing(),
        onGenerateRoute: routes.transitionRoutes);
  }

  Widget loadingScreen() {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

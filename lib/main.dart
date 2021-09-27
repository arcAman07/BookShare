import 'package:flutter/material.dart';
import 'package:bookfetch/screens/welcome_screen.dart';
import 'package:bookfetch/screens/get_screen.dart';
import 'package:bookfetch/screens/Post_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen':(context) => WelcomeScreen(),
        'post_screen':(context) => PostScreen(),
        'get_screen':(context) => GetScreen(),
        // 'chat_screen':(context) => ChatScreen(),

      },
    );
  }
}


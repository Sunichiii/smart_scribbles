import 'package:flutter/material.dart';
import 'package:learn_to_write/assets/pages/easy%20level/easy_level.dart';
import 'assets/pages/difficulty_screen.dart';
import 'assets/pages/home_screen.dart';


void main() {
  runApp(SmartScribblesApp());
}

class SmartScribblesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Feather',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/difficulty': (context) => DifficultyScreen(),
        '/level1': (context) => EasyLevelScreen(currentDigit: 0,)
      },
    );
  }
}

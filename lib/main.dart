import 'package:flutter/material.dart';
import 'package:my_therapy_app/UI/HomePage.dart';
import 'package:my_therapy_app/services/Authantication.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'therapy app',
      theme: new ThemeData(
        primaryColor: const Color(0xFF43a447),
        accentColor: const Color(0xFFffcc00),
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
      ),
      home: new HomePage(new Auth()),
    );
  }


}


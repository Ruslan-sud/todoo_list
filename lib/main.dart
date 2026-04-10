import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primaryColor: const Color(0xff1976D2),
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
      ),
      home: const MyHomePage(),
    );
  }
}


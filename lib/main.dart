import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home_page.dart';
import 'onboarding/onboarding_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final bool onboardingSeen =
      prefs.getBool('onboardingSeen') ?? false;

  runApp(MyApp(
    onboardingSeen: onboardingSeen,
  ));
}

class MyApp extends StatelessWidget {

  final bool onboardingSeen;

  const MyApp({
    super.key,
    required this.onboardingSeen,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: onboardingSeen
          ? const MyHomePage()
          : const OnboardingPage(),
    );
  }
}
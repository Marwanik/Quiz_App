import 'package:flutter/material.dart';
import 'package:quizfullapp/Leaderboard/leaderboardScreen.dart';
import 'package:quizfullapp/Login/LoginScreen.dart';
import 'package:quizfullapp/Quiz/QuizIUI.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'config/get_it_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Call before runApp
  runApp(const MyApp());
  //await clearSharedPreferences();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (core.get<SharedPreferences>().getString('name') == null)
            ? LoginScreen()
            : QuizPage(),
    );
  }
}

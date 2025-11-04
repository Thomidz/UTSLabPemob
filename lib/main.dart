import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'providers/quiz_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quiz App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: quizProvider.isDarkMode
                    ? Brightness.dark
                    : Brightness.light,
              ),
              fontFamily: 'Poppins',
              useMaterial3: true,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => WelcomeScreen(),
              '/quiz': (context) => const QuizScreen(),
              '/result': (context) => const ResultScreen(),
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../models/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final score = quizProvider.score;
    final total = quizQuestions.length;
    final percentage = (score / total) * 100;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              quizProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: quizProvider.isDarkMode
                ? 'Ubah ke Light Mode'
                : 'Ubah ke Dark Mode',
            onPressed: () => quizProvider.toggleTheme(),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat ${quizProvider.userName}!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Skor Anda:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$score / $total',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: isDarkMode ? Colors.amberAccent : Colors.blueAccent,
                  ),
                ),
                Text(
                  '${percentage.toStringAsFixed(1)}%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.amberAccent : Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 40),
                // 🔹 Tidak diubah sama sekali (sesuai permintaan)
                ElevatedButton(
                  onPressed: () {
                    quizProvider.resetQuiz();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Coba Lagi',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

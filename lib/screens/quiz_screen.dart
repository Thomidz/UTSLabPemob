import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/quiz_question.dart';
import 'welcome_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin keluar dari kuis?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Tutup dialog
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              // Reset data kuis melalui provider
              final quizProvider =
              Provider.of<QuizProvider>(context, listen: false);
              quizProvider.resetQuiz();

              Navigator.pop(context); // Tutup dialog
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    (route) => false,
              );
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hai, ${quizProvider.userName}'),
        actions: [
          // Tombol toggle dark/light mode
          IconButton(
            icon: Icon(
              quizProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: quizProvider.isDarkMode
                ? 'Ubah ke Light Mode'
                : 'Ubah ke Dark Mode',
            onPressed: () => quizProvider.toggleTheme(),
          ),

          // Tombol keluar kuis
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Keluar',
            onPressed: () => _showExitDialog(context),
          ),
        ],
      ),
      body: Center(
        child: quizProvider.currentQuestionIndex < quizProvider.questions.length
            ? QuizQuestion(
          question: quizProvider
              .questions[quizProvider.currentQuestionIndex],
        )
            : const Text('Tidak ada pertanyaan.'),
      ),
    );
  }
}



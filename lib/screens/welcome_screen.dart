import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Gunakan Consumer agar AppBar ikut rebuild ketika mode berubah
          Consumer<QuizProvider>(
            builder: (context, quizProvider, _) => IconButton(
              icon: Icon(
                quizProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              tooltip: quizProvider.isDarkMode
                  ? 'Ubah ke Light Mode'
                  : 'Ubah ke Dark Mode',
              onPressed: () => quizProvider.toggleTheme(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Selamat Datang di\nQuiz Dz',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Masukkan Nama Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isNotEmpty) {
                    context
                        .read<QuizProvider>()
                        .setUserName(_nameController.text.trim());
                    Navigator.pushReplacementNamed(context, '/quiz');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Mulai Quiz',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

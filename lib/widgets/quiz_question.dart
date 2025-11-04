import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/question.dart';
import '../providers/quiz_provider.dart';
import 'custom_button.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({super.key, required Question question});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        final question = quizQuestions[quizProvider.currentQuestionIndex];
        final userAnswer = quizProvider.userAnswers[quizProvider.currentQuestionIndex];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              'Pertanyaan ${quizProvider.currentQuestionIndex + 1} dari ${quizQuestions.length}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  question.question,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(
              question.options.length,
                  (index) => CustomButton(
                text: question.options[index],
                isSelected: userAnswer == index,
                onPressed: () {
                  quizProvider.answerQuestion(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (quizProvider.currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () => quizProvider.previousQuestion(),
                    child: const Text('Sebelumnya'),
                  ),
                if (quizProvider.currentQuestionIndex < quizQuestions.length - 1)
                  ElevatedButton(
                    onPressed: userAnswer != null ? () => quizProvider.nextQuestion() : null,
                    child: const Text('Selanjutnya'),
                  ),
                if (quizProvider.currentQuestionIndex == quizQuestions.length - 1)
                  ElevatedButton(
                    onPressed: userAnswer != null
                        ? () => Navigator.pushReplacementNamed(context, '/result')
                        : null,
                    child: const Text('Selesai'),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
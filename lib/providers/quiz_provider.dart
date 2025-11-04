import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizProvider extends ChangeNotifier {
  String _userName = '';
  int _currentQuestionIndex = 0;
  List<int?> _userAnswers = [];
  bool _isDarkMode = false;

  QuizProvider() {
    // Pindahkan inisialisasi ke sini, aman untuk load quizQuestions
    _userAnswers = List.filled(quizQuestions.length, null);
  }

  String get userName => _userName;
  int get currentQuestionIndex => _currentQuestionIndex;
  List<int?> get userAnswers => _userAnswers;
  bool get isDarkMode => _isDarkMode;
  bool get isQuizCompleted => !_userAnswers.contains(null);

  int get score {
    int correctAnswers = 0;
    for (int i = 0; i < quizQuestions.length; i++) {
      if (_userAnswers[i] == quizQuestions[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  List<Question> get questions => quizQuestions;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void answerQuestion(int answerIndex) {
    _userAnswers[_currentQuestionIndex] = answerIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < quizQuestions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _userAnswers = List.filled(quizQuestions.length, null);
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

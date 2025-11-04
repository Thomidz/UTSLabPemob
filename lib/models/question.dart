class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imageUrl;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.imageUrl,
  });
}

final List<Question> quizQuestions = [
  Question(
    question: 'Manakah planet yang memiliki cincin paling besar di tata surya?',
    options: ['Mars', 'Jupiter', 'Saturnus', 'Uranus'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Siapa presiden pertama Indonesia?',
    options: ['Soekarno', 'Soeharto', 'Habibie', 'Megawati'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'Apa Ultraman Heisei pertama??',
    options: ['Dyna', 'Gaia', 'Tiga', 'Cosmos'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Streamer terbaik abad ini?',
    options: ['Windah Basudara', 'iShowSpeed', 'Kai Cenat', 'Ninja'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'Kapan Indonesia merdeka?',
    options: ['15 Agustus 1945', '16 Agustus 1945', '17 Agustus 1945', '18 Agustus 1945'],
    correctAnswerIndex: 2,
  ),
];
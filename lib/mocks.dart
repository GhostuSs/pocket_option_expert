import 'package:pocket_option_expert/domain/models/quiz_question/quiz_question_model.dart';

abstract class Mocks {
  static const List<Map<String, dynamic>> easyQuiz = [
    <String, dynamic>{
      'question': 'What is a consensus mechanism in blockchain?',
      'correct': 0,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'What is a consensus mechanism in blockchain?',
      'correct': 2,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'What is a consen blockchain?',
      'correct': 3,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'Whackchain?',
      'correct': 4,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'Whatn blockchain?',
      'correct': 0,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'What is aockchain?',
      'correct': 0,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'What iockchain?',
      'correct': 0,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
    <String, dynamic>{
      'question': 'What is a consensussm in blockchain?',
      'correct': 0,
      'answers': ['hz', 'pg', 'dsd', 'dsds'],
    },
  ];
  static final List<QuizQuestion> easyQuizQuestions = List.generate(
      easyQuiz.length, (index) => QuizQuestion.fromJson(easyQuiz[index]));
}

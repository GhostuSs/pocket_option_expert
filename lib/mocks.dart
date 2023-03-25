import 'package:pocket_option_expert/domain/models/quiz_question/quiz_question_model.dart';

abstract class Mocks {
  static const List<Map<String, dynamic>> easyQuiz = [
    <String, dynamic>{
      'question': 'What is a consensus mechanism in blockchain?',
      'correct': 2,
      'answers': ['Process to distribute tokens', 'Agreement method to validate transactions', 'Process to buy crypto', 'Process of creating bitcoin'],
    },
    <String, dynamic>{
      'question': 'What is Proof of Work consensus mechanism?',
      'correct': 4,
      'answers': ['None of above', 'Mechanism to track', 'Mechanism to track workload', 'Agreement mechanism of transactions'],
    },
    <String, dynamic>{
      'question': 'What is Proof of Stake consensus mechanism?',
      'correct': 4,
      'answers': ['Certificate to use blockchain', 'A password', 'How private keys are made', 'Transaction and block verification protocol'],
    },
    <String, dynamic>{
      'question': 'What incentivizes miners to validate transactions?',
      'correct': 2,
      'answers': ['Nonce', 'Block reward', 'More memory', 'Recognition by community'],
    },
    <String, dynamic>{
      'question': 'Ethereum is changing its consensus mechanism from…',
      'correct': 1,
      'answers': ['Pow to pos', 'Pos to pow', 'Pow to Poh', 'Not changing'],
    },
    <String, dynamic>{
      'question': 'Which of these are pros of Proof of Work?',
      'correct': 4,
      'answers': ['Highly secure', 'open and decentralised', 'proven and scale', 'all of the above'],
    },
    <String, dynamic>{
      'question': 'What is Proof of Work consensus mechanism?',
      'correct': 4,
      'answers': ['None of above', 'Mechanism to track', 'Mechanism to track workload', 'Agreement mechanism of transactions'],
    },
    <String, dynamic>{
      'question': 'Cardano is based on which consensus mechanism?',
      'correct': 1,
      'answers': ['Proof of Stake', 'Proof of work', 'Proof of authority', 'Proof of burn'],
    },
  ];
  static final List<QuizQuestion> easyQuizQuestions = List.generate(
      easyQuiz.length, (index) => QuizQuestion.fromJson(easyQuiz[index]));
}

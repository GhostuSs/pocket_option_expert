import 'package:pocket_option_expert/domain/models/quiz_question/quiz_question_model.dart';

abstract class Mocks {
  static const List<Map<String, dynamic>> _easyQuiz = [
    <String, dynamic>{
      'question': 'What is a consensus mechanism in blockchain?',
      'correct': 2,
      'answers': [
        'Process to distribute tokens',
        'Agreement method to validate transactions',
        'Process to buy crypto',
        'Process of creating bitcoin'
      ],
    },
    <String, dynamic>{
      'question': 'What is Proof of Work consensus mechanism?',
      'correct': 4,
      'answers': [
        'None of above',
        'Mechanism to track',
        'Mechanism to track workload',
        'Agreement mechanism of transactions'
      ],
    },
    <String, dynamic>{
      'question': 'What is Proof of Stake consensus mechanism?',
      'correct': 4,
      'answers': [
        'Certificate to use blockchain',
        'A password',
        'How private keys are made',
        'Transaction and block verification protocol'
      ],
    },
    <String, dynamic>{
      'question': 'What incentivizes miners to validate transactions?',
      'correct': 2,
      'answers': [
        'Nonce',
        'Block reward',
        'More memory',
        'Recognition by community'
      ],
    },
    <String, dynamic>{
      'question': 'Ethereum is changing its consensus mechanism from…',
      'correct': 1,
      'answers': ['Pow to pos', 'Pos to pow', 'Pow to Poh', 'Not changing'],
    },
    <String, dynamic>{
      'question': 'Which of these are pros of Proof of Work?',
      'correct': 4,
      'answers': [
        'Highly secure',
        'open and decentralised',
        'proven and scale',
        'all of the above'
      ],
    },
    <String, dynamic>{
      'question': 'What is Proof of Work consensus mechanism?',
      'correct': 4,
      'answers': [
        'None of above',
        'Mechanism to track',
        'Mechanism to track workload',
        'Agreement mechanism of transactions'
      ],
    },
    <String, dynamic>{
      'question': 'Cardano is based on which consensus mechanism?',
      'correct': 1,
      'answers': [
        'Proof of Stake',
        'Proof of work',
        'Proof of authority',
        'Proof of burn'
      ],
    },
  ];
  static const List<Map<String, dynamic>> _normalQuiz = [
    <String, dynamic>{
      'question': 'What incentivizes miners to validate transactions?',
      'correct': 2,
      'answers': [
        'Nonce',
        'Block reward',
        'More memory',
        'Recognition by community'
      ],
    },
    <String, dynamic>{
      'question': 'Which of the following are pillars of blockchain technology?',
      'correct': 3,
      'answers': [
        'Lines',
        'Circle',
        'Blocks',
        'None of the above'
      ],
    },
    <String, dynamic>{
      'question': 'What is a miner?',
      'correct': 4,
      'answers': [
        'A type of blockchain',
        'A prediction algorithm',
        'A banker verifying transactions',
        'Computer that validate transactions'
      ],
    },
    <String, dynamic>{
      'question': 'What is Proof of Work consensus mechanism?',
      'correct': 4,
      'answers': [
        'None of above',
        'Mechanism to track',
        'Mechanism to track workload',
        'Agreement mechanism of transactions'
      ],
    },
    <String, dynamic>{
      'question': 'What is the process of creating new bitcoins popularly known as?',
      'correct': 3,
      'answers': [
        'Finding',
        'Sourcing',
        'Mining',
        'Parsing'
      ],
    },
    <String, dynamic>{
      'question': 'What is a consensus mechanism in blockchain?',
      'correct': 2,
      'answers': [
        'Process to distribute tokens',
        'Agreement method to validate transactions',
        'Process to buy crypto',
        'Process of creating bitcoin'
      ],
    },
    <String, dynamic>{
      'question': 'What makes cryptocurrency secure?',
      'correct': 2,
      'answers': [
        'Servers',
        'Cryptographic maths',
        'Government banks',
        'Insurance companies'
      ],
    },
    <String, dynamic>{
      'question': 'Which of the following are pillars of blockchain technology?',
      'correct': 4,
      'answers': [
        'Decentralization',
        'Immutability',
        'Transparency',
        'All of the above'
      ],
    },
  ];
  static const List<Map<String, dynamic>> _hardQuiz = [
    <String, dynamic>{
      'question': 'Which of the following are pillars of blockchain technology?',
      'correct': 3,
      'answers': [
        'Lines',
        'Circle',
        'Blocks',
        'None of the above'
      ],
    },
    <String, dynamic>{
      'question': 'Crypto tax slab applicable in India?',
      'correct': 2,
      'answers': [
        '28%',
        '30%',
        '43%',
        '60%'
      ],
    },
    <String, dynamic>{
      'question': 'What is the world’s most actively traded crypto coin?',
      'correct': 1,
      'answers': [
        'Bitcoin',
        'Dogecoin',
        'PolkaDot',
        'Tether'
      ],
    },
    <String, dynamic>{
      'question': 'What is the process of creating new bitcoins popularly known as?',
      'correct': 3,
      'answers': [
        'Finding',
        'Sourcing',
        'Mining',
        'Parsing'
      ],
    },
    <String, dynamic>{
      'question': 'What incentivizes miners to validate transactions?',
      'correct': 2,
      'answers': [
        'Nonce',
        'Block reward',
        'More memory',
        'Recognition by community'
      ],
    },
    <String, dynamic>{
      'question': 'What is a consensus mechanism in blockchain?',
      'correct': 2,
      'answers': [
        'Process to distribute tokens',
        'Agreement method to validate transactions',
        'Process to buy crypto',
        'Process of creating bitcoin'
      ],
    },
    <String, dynamic>{
      'question': 'What makes cryptocurrency secure?',
      'correct': 2,
      'answers': [
        'Servers',
        'Cryptographic maths',
        'Government banks',
        'Insurance companies'
      ],
    },
    <String, dynamic>{
      'question': 'Which of the following are pillars of blockchain technology?',
      'correct': 4,
      'answers': [
        'Decentralization',
        'Immutability',
        'Transparency',
        'All of the above'
      ],
    },
  ];
  static final List<QuizQuestion> easyQuizQuestions = List.generate(
      _easyQuiz.length, (index) => QuizQuestion.fromJson(_easyQuiz[index]),);
  static final List<QuizQuestion> normalQuizQuestions = List.generate(
    _easyQuiz.length, (index) => QuizQuestion.fromJson(_normalQuiz[index]),);
  static final List<QuizQuestion> hardQuizQuestions = List.generate(
    _easyQuiz.length, (index) => QuizQuestion.fromJson(_hardQuiz[index]),);
}

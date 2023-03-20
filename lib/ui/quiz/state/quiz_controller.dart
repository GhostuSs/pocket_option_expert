import 'dart:async';

import 'package:get/get.dart';
import 'package:pocket_option_expert/mocks.dart';
import 'package:pocket_option_expert/ui/quiz/state/uikit/quiz_button.dart';

class QuizController extends GetxController {
  var currQuiz = Mocks.easyQuizQuestions.obs;
  var currQuestionIndex = 0.obs;
  var lock = false.obs;
  var answersState = List.generate(4, (index) => AnswerState.active).obs;

  Future<void> onAnswerChosen({required int selectedIndx}) async {
    lock.value=true;
    if (selectedIndx == currQuiz[currQuestionIndex.value].correct) {
      answersState[selectedIndx] = AnswerState.correct;
    }else{
      answersState[selectedIndx] = AnswerState.wrong;
    }
  }

  Future<void> nextQuestion() async {
    await Future<void>.delayed(
      const Duration(
        seconds: 1,
        milliseconds: 500,
      ),
    );
    answersState.value=List.generate(4, (index) => AnswerState.active);
    if (currQuestionIndex.value < 7) {
      currQuestionIndex.value++;
    }
    lock.value=false;
  }
}

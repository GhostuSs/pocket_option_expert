import 'dart:async';

import 'package:get/get.dart';
import 'package:pocket_option_expert/mocks.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/quiz_button.dart';

class QuizController extends GetxController {
  var currQuiz = Mocks.easyQuizQuestions.obs;
  var currQuestionIndex = 0.obs;
  var lock = false.obs;
  // var timeLeft = 0.obs;
  // Timer? timer;
  var answersState = [AnswerState.active,AnswerState.active,AnswerState.active,AnswerState.active].obs;

  Future<void> onAnswerChosen({required int selectedIndx}) async {
    lock.value = true;
    if (selectedIndx == currQuiz[currQuestionIndex.value].correct) {
      answersState[selectedIndx] = AnswerState.correct;
    } else {
      answersState[selectedIndx] = AnswerState.wrong;
    }
    await Future<void>.delayed(
    const Duration(
    seconds: 1,
    milliseconds: 500,
    ),
        nextQuestion
    );
  }

  void nextQuestion(){
    // if(timer==null){
    //   timeLeft.value=120;
    //   timer = Timer.periodic(const Duration(seconds: 1), (time) {
    //     if (timeLeft.value > 0) {
    //       timeLeft--;
    //     } else {
    //       timer?.cancel();
    //     }
    //   });
    // }
    answersState.value = [AnswerState.active,AnswerState.active,AnswerState.active,AnswerState.active];
    if (currQuestionIndex.value < 7) {
      currQuestionIndex.value++;
    }
    // else{
      // timer?.cancel();
    // }
    lock.value = false;
  }
}

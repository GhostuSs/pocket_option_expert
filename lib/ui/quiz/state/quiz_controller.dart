import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_option_expert/domain/models/quiz_question/quiz_question_model.dart';
import 'package:pocket_option_expert/mocks.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/quiz_button.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/result_dialog.dart';

class QuizController extends GetxController {
  QuizController();
  var currQuiz = Mocks.easyQuizQuestions.obs;
  var currQuestionIndex = 0.obs;
  Timer? timer;
  var time = 0.obs;
  int wonSum=0;
  int correct = 0;
  int remainSeconds = 1;
  var answersState = <AnswerState>[].obs;

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  void _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    timer = Timer.periodic(duration, (timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        remainSeconds--;
      }
      time.value = remainSeconds;
    });
  }

  Future<void> onAnswerChosen({required int selectedIndx,required BuildContext context,}) async {
    if (selectedIndx + 1 == currQuiz[currQuestionIndex.value].correct) {
      answersState[selectedIndx] = AnswerState.correct;
      correct++;
    } else {
      answersState[selectedIndx] = AnswerState.wrong;
    }
    await Future<void>.delayed(
      const Duration(
        seconds: 1,
        milliseconds: 500,
      ),
    );
    answersState.value = [
      AnswerState.active,
      AnswerState.active,
      AnswerState.active,
      AnswerState.active
    ];
    if (currQuestionIndex.value + 1 < currQuiz.value.length) {
      currQuestionIndex.value++;
    } else {
      timer?.cancel();
      showResDialog(context: context);
    }
  }

  void initState({
    List<QuizQuestion>? questions,
    int? time,
  }) {
    currQuiz = (questions ?? Mocks.easyQuizQuestions).obs;
    remainSeconds = time ?? 120;
    _startTimer(remainSeconds);
    currQuestionIndex.value = 0;
    answersState.value = [
      AnswerState.active,
      AnswerState.active,
      AnswerState.active,
      AnswerState.active
    ];
  }

  void showResDialog({
    required BuildContext context,
  }) {
    showDialog<void>(
      context: context,
      builder: (c) => ResultDialog(
        scores: correct,
        wonSum: wonSum,
      ),
    );
  }
}

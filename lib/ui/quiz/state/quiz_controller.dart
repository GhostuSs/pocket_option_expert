import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/domain/models/quiz_question/quiz_question_model.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/mocks.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/quiz_button.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/result_dialog.dart';

class QuizController extends GetxController {
  QuizController();
  var currQuiz = Mocks.easyQuizQuestions.obs;
  var currQuestionIndex = 0.obs;
  Timer? timer;
  String difficulty='Easy';
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
    remainSeconds = seconds;
    _initTimer();
  }


  Future<void> onAnswerChosen({required int selectedIndx,required BuildContext context,}) async {
    if(currQuestionIndex.value==0)_startTimer(remainSeconds);
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

  void initState() {
    chooseDifficulty();
    currQuestionIndex.value = 0;
    answersState.value = [
      AnswerState.active,
      AnswerState.active,
      AnswerState.active,
      AnswerState.active
    ];
  }

  void chooseDifficulty(){
    final _diffHive = Hive.box<UserModel>('user').values.first.difficultyLevel!;
    difficulty=_diffHive.firstLetterToUpperCase();
    _chooseQuiz();
    _chooseTime();

  }

  void _chooseQuiz(){
    final _diffHive = Hive.box<UserModel>('user').values.first.difficultyLevel!;
    switch(_diffHive){
      case "easy":currQuiz.value=Mocks.easyQuizQuestions;
      break;
      case "normal":currQuiz.value=Mocks.normalQuizQuestions;
      break;
      case "hard":currQuiz.value=Mocks.hardQuizQuestions;
    }
    currQuestionIndex.value=0;
  }

  void _chooseTime(){
    final _diffHive = Hive.box<UserModel>('user').values.first.difficultyLevel!;
    if(timer?.isActive==true)timer?.cancel();
    switch(_diffHive){
      case "easy":remainSeconds=120;
      break;
      case "normal":remainSeconds=400;
      break;
      case "hard":remainSeconds=500;
    }
    time.value=remainSeconds;
    currQuestionIndex.value=0;
  }

  void _initTimer(){
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        remainSeconds--;
      }
      time.value = remainSeconds;
    });
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

extension StringExtension on String{
  String firstLetterToUpperCase(){
    return this[0].toUpperCase()+toLowerCase().replaceFirst(this[0], '');
  }
}
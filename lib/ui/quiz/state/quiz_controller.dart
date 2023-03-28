import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:pocket_option_expert/domain/models/quiz_history/quiz_his_model.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/mocks.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/difficulty/difficulty_screen.dart';
import 'package:pocket_option_expert/ui/profile/profile_controller/profile_controller.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/quiz_button.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/result_dialog.dart';

class QuizController extends GetxController {
  QuizController();
  var currQuiz = Mocks.easyQuizQuestions.obs;
  var currQuestionIndex = 0.obs;
  Timer? timer;
  var used = false.obs;
  String difficulty = 'Easy';
  var time = 0.obs;
  int wonSum = 0;
  int correct = 0;
  int remainSeconds = 1;
  var userData = Hive.box<UserModel>('user').values.first.obs;
  var answersState = [
    AnswerState.active,
    AnswerState.active,
    AnswerState.active,
    AnswerState.active
  ].obs;
  var lock = false.obs;

  @override
  void onClose() {
    debugPrint('close');
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  void _startTimer(int seconds, BuildContext context) {
    remainSeconds = seconds;
    _initTimer(context: context);
  }

  Future<void> onAnswerChosen({
    required int selectedIndx,
    required BuildContext context,
  }) async {
    lock.value = true;
    used.value = false;
    final _user = Hive.box<UserModel>('user').values.first;
    if (currQuestionIndex.value == 0) _startTimer(remainSeconds, context);
    if (selectedIndx + 1 == currQuiz[currQuestionIndex.value].correct) {
      answersState[selectedIndx] = AnswerState.correct;
      _user.balance = (_user.balance ?? 1000) + 20;
      wonSum += 20;
      correct++;
      await Hive.box<UserModel>('user').put('user', _user);
    } else {
      answersState[selectedIndx] = AnswerState.wrong;
    }
    await Future<void>.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    answersState.value = [
      AnswerState.active,
      AnswerState.active,
      AnswerState.active,
      AnswerState.active
    ];
    if (currQuestionIndex.value + 1 < currQuiz.length) {
      currQuestionIndex.value++;
    } else {
      timer?.cancel();
      await showResDialog(context: context);
    }
    lock.value = false;
  }

  void initState() {
    debugPrint('initState');
    chooseDifficulty();
  }

  void chooseDifficulty() {
    final _diffHive = Hive.box<UserModel>('user').values.first.difficultyLevel!;
    difficulty = _diffHive.firstLetterToUpperCase();
    _chooseQuiz();
    _chooseTime();
  }

  void _chooseQuiz() {
    final _diffHive = Hive.box<UserModel>('user').values.first.difficultyLevel!;
    switch (_diffHive) {
      case 'easy':
        currQuiz.value = Mocks.easyQuizQuestions;
        break;
      case 'normal':
        currQuiz.value = Mocks.normalQuizQuestions;
        break;
      case 'hard':
        currQuiz.value = Mocks.hardQuizQuestions;
    }
    currQuestionIndex.value = 0;
  }

  void _chooseTime() {
    final _diffHive = Hive.box<UserModel>('user').values.first.difficultyLevel!;
    if (timer?.isActive == true) timer?.cancel();
    switch (_diffHive) {
      case 'easy':
        remainSeconds = 120;
        break;
      case 'normal':
        remainSeconds = 400;
        break;
      case 'hard':
        remainSeconds = 500;
    }
    time.value = remainSeconds;
    currQuestionIndex.value = 0;
  }

  void _initTimer({required BuildContext context}) {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (timer) {
      if (remainSeconds == 0) {
        timer.cancel();
        showResDialog(context: context);
      } else {
        remainSeconds--;
      }
      time.value = remainSeconds;
    });
  }

  Future<void> showResDialog({
    required BuildContext context,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (c) => ResultDialog(
        scores: correct,
        wonSum: wonSum,
      ),
    );
    final _user = Hive.box<UserModel>('user').values.first;
    switch (difficulty.toLowerCase()) {
      case 'easy':
        _user.easy = _correctHistoryResult(lastData: _user.easy!);
        break;
      case 'normal':
        _user.normal = _correctHistoryResult(lastData: _user.normal!);
        break;
      case 'hard':
        _user.hard = _correctHistoryResult(lastData: _user.hard!);
        break;
    }
    Get.find<ProfileController>().updateProfile(user: _user);
  }

  void showLeaveDialog({required BuildContext context}) {
    showDialog<void>(
      context: context,
      builder: (cont) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: CupertinoAlertDialog(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Leave the game?',
              style: AppTypography.mainStyle.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'If you exit the game, you will loose everything you earned',
              style: AppTypography.mainStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.pop(cont),
              textStyle: AppTypography.mainStyle.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(cont);
                pushNewScreen<void>(
                  context,
                  screen: const DifficultyScreen(),
                );
              },
              textStyle: AppTypography.mainStyle.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
              child: const Text('Leave'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> removeIncorrectAnswer() async {
    bool found = false;
    while (!found && !used.value) {
      final index = Random().nextInt(3);
      if (kDebugMode) {
        print(index);
      }
      if (index + 1 != currQuiz[currQuestionIndex.value].correct) {
        found = true;
        answersState[index] = AnswerState.disabled;
        used.value = true;
      }
    }
    userData.value.removeInc = userData.value.removeInc! - 1;
    unawaited(Hive.box<UserModel>('user').put('user', userData.value));
  }

  Future<void> useFiftyFifty() async {
    bool found = false;
    for (int i = 0; i < 2; i++) {
      found = false;
      while (!found && !used.value) {
        final index = Random().nextInt(3);
        if (kDebugMode) {
          print(index);
        }
        if (index + 1 != currQuiz[currQuestionIndex.value].correct) {
          answersState[index] = AnswerState.disabled;
          found = true;
        }
      }
    }
    used.value = true;
    userData.value.removeInc = userData.value.removeInc! - 1;
    unawaited(
      Hive.box<UserModel>('user').put('user', userData.value),
    );
  }

  Future<void> showCorrectAnswer({
    required BuildContext context,
  }) async {
    used.value = true;
    userData.value.show = userData.value.removeInc! - 1;
    await onAnswerChosen(
        selectedIndx: currQuiz[currQuestionIndex.value].correct! - 1,
        context: context);
  }

  QuizHistory _correctHistoryResult({required QuizHistory lastData}) {
    if ((lastData.currRes ?? 0) < correct) {
      if(lastData.currRes!=0){
        final prelastNew = lastData.currRes;
        lastData
          ..prelastRes = prelastNew
          ..currRes = correct;
      }else{
        lastData.currRes=correct;
      }
      return lastData;
    } else {
      if ((lastData.prelastRes ?? 0) < correct) {
        lastData.prelastRes = correct;
      }
      return lastData;
    }
  }

  // QuizHistory? _getCurrBest({required QuizHistory? historyData}){
  //   //TODO: Correct
  //
  //   final QuizHistory? history = historyData;
  //   if (kDebugMode) {
  //     print(correct);
  //   }
  //   final int currentValue = correct;
  //   debugPrint(currentValue.toString());
  //   if((historyData?.currRes ?? 0)<currentValue){
  //     history?.currRes=currentValue;
  //     return history;
  //   }
  //   return history;
  // }
  //
  // QuizHistory? _getPreLastBest({required QuizHistory? historyData}){
  //   //TODO: Correct
  //   final QuizHistory? history = historyData;
  //   debugPrint(correct.toString());
  //   if((historyData?.prelastRes ?? 0)<correct){
  //     history?.prelastRes=correct;
  //     return history;
  //   }else{
  //     // if((historyData?.currRes ?? 0)>currentValue){
  //     //   history?.prelastRes=historyData?.currRes;
  //     // }
  //     debugPrint('else prelase');
  //   }
  //   return history;
  // }
}

extension StringExtension on String {
  String firstLetterToUpperCase() {
    return this[0].toUpperCase() + toLowerCase().replaceFirst(this[0], '');
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/quiz/state/quiz_controller.dart';
import 'package:pocket_option_expert/ui/settings/uikit/difficulty.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class DifficultyScreen extends StatefulWidget {
  const DifficultyScreen({Key? key}) : super(key: key);

  @override
  State<DifficultyScreen> createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  int currInd = 0;
  int currLevel = 0;

  @override
  Widget build(BuildContext context) => WillPopScope(child: Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.fill,
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustAppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            DiffButton(
              label: 'EASY',
              onTap: () => _onTap(level: 'easy'),
              isSelected: _difficultySelector() == 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: DiffButton(
                label: 'NORMAL',
                onTap: () => _onTap(level: 'normal'),
                isSelected: _difficultySelector() == 1,
              ),
            ),
            DiffButton(
              label: 'HARD',
              onTap: () => _onTap(level: 'hard'),
              isSelected: _difficultySelector() == 2,
            ),
          ],
        ),
      ),
    ),
  ), onWillPop: ()async=>false,);

  Color selector(bool isSelected) {
    return isSelected ? AppColors.blue : AppColors.blue.withOpacity(0.5);
  }

  void _onTap({required String level}) async {
    final _user = Hive.box<UserModel>('user').values.first;
    _user.difficultyLevel = level;
    await Hive.box<UserModel>('user').put('user', _user);
    Get.find<QuizController>().chooseDifficulty();
    Navigator.pop(context);
  }


  int _difficultySelector() {
    switch (Hive.box<UserModel>('user').values.first.difficultyLevel) {
      case 'normal':
        return 1;
      case 'hard':
        return 2;
      default:
        return 0;
    }
  }
}


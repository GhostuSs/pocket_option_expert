import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_option_expert/ui/profile/uikit/profile_widget.dart';
import 'package:pocket_option_expert/ui/quiz/state/quiz_controller.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuizController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
      ),
      child: GetBuilder<QuizController>(
        init: controller,
        builder: (c)=>Scaffold(
          appBar: const CustAppBar(),
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                if(controller.userData.value.easy?.currRes!=null)QuizHistoryCard(
                  label: 'EASY QUIZ',
                  points: controller.userData.value.easy?.currRes ?? 0,
                  preLast: controller.userData.value.easy?.prelastRes,
                ),
                if(controller.userData.value.normal?.currRes!=null)Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: QuizHistoryCard(
                      label: 'NORMAL QUIZ',
                      points: controller.userData.value.normal?.currRes ?? 0,
                      preLast: controller.userData.value.normal?.prelastRes),
                ),
                if(controller.userData.value.hard?.currRes!=null)QuizHistoryCard(
                    label: 'HARD QUIZ',
                    points: controller.userData.value.hard?.currRes ?? 0,
                    preLast: controller.userData.value.hard?.prelastRes)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

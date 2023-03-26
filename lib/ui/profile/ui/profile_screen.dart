import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_option_expert/ui/profile/profile_controller/profile_controller.dart';
import 'package:pocket_option_expert/ui/profile/uikit/profile_widget.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userData = Get.find<ProfileController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: const CustAppBar(),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: GetBuilder<ProfileController>(
            init: _userData,
            builder: (c) => Obx(()=>Column(
              children: [
                QuizHistoryCard(
                  label: 'EASY QUIZ',
                  points: _userData.userData.value.easy?.currRes ?? 0,
                  preLast: _userData.userData.value.easy?.prelastRes,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: QuizHistoryCard(
                      label: 'NORMAL QUIZ',
                      points: _userData.userData.value.normal?.currRes ?? 0,
                      preLast: _userData.userData.value.normal?.prelastRes),
                ),
                QuizHistoryCard(
                    label: 'HARD QUIZ',
                    points: _userData.userData.value.hard?.currRes ?? 0,
                    preLast: _userData.userData.value.hard?.prelastRes)
              ],
            )),
          ),
        ),
      ),
    );
  }
}

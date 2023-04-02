import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/difficulty/difficulty_screen.dart';
import 'package:pocket_option_expert/ui/quiz/state/quiz_controller.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/helper_widget.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/quiz_button.dart';
import 'package:pocket_option_expert/ui/shop/ui/shop_screen.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<QuizController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
      ),
      child: GetBuilder<QuizController>(
        init: _controller,
        initState: (vm) => _controller.initState(),
        builder: (obj) => Obx(()=>Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustAppBar(
            seconds: _controller.time.value,
            showLabels: true,
            action: InkWell(
              onTap: () =>
                  pushNewScreen<void>(context, screen: const ShopScreen()),
              child: Center(
                child: SvgPicture.asset('assets/images/shop.svg'),
              ),
            ),
          ),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20.h,
            ),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: _controller
                        .currQuiz[_controller.currQuestionIndex.value]
                        .question,
                    style: AppTypography.mainStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 23.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                for (int i = 0;
                i <
                    _controller
                        .currQuiz[_controller.currQuestionIndex.value]
                        .answers!
                        .length;
                i++)
                  QuizButton(
                      label: _controller
                          .currQuiz[_controller.currQuestionIndex.value]
                          .answers![i],
                      locker: i + 1 ==
                          _controller
                              .currQuiz[
                          _controller.currQuestionIndex.value]
                              .correct &&
                          _controller.lock.value,
                      state: _controller.answersState[i],
                      onTap: () async {
                        if (!_controller.lock.value) {
                          await _controller.onAnswerChosen(
                            selectedIndx: i,
                            context: context,
                          );
                        }
                      }),
                const Spacer(),
                Obx(()=>Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => _controller.timer!=null ? _controller.showLeaveDialog(context: context) :pushNewScreen<void>(context,
                                screen: const DifficultyScreen(),),
                              child: Text(
                                '${_controller.difficulty} level',
                                style: AppTypography.mainStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.sp,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            const RotatedBox(
                              quarterTurns: -1,
                              child: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${_controller.currQuestionIndex.value + 1}/${_controller.currQuiz.value.length}',
                          style: AppTypography.mainStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 30.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    if((_controller.userData.value.removeInc ?? 0)>0)HelperWidget(
                      label: '75/25',
                      onTap: _controller.removeIncorrectAnswer,
                    ),
                    if((_controller.userData.value.fiftyFifty ?? 0)>0)Padding(
                        padding: EdgeInsets.symmetric(horizontal:8.sp),
                        child: HelperWidget(
                          label: '50/50',
                          onTap: _controller.useFiftyFifty,
                        ))else SizedBox(width:16.sp),
                    if((_controller.userData.value.show ?? 0)>0)HelperWidget(
                      label: 'SHOW',
                      onTap: () async =>_controller.showCorrectAnswer(context: context),
                    ),
                  ],
                ),),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

// class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const QuizAppBar({super.key, required this.controller});
//   final QuizController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => CustAppBar(
//         // seconds: controller.timeLeft.value,
//         showLabels: true,
//         action: InkWell(
//           onTap: () => pushNewScreen<void>(context, screen: const ShopScreen()),
//           child: Center(
//             child: SvgPicture.asset('assets/images/shop.svg'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size(double.infinity, 50.h);
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/quiz/state/quiz_controller.dart';
import 'package:pocket_option_expert/ui/quiz/state/uikit/helper_widget.dart';
import 'package:pocket_option_expert/ui/quiz/state/uikit/quiz_button.dart';
import 'package:pocket_option_expert/ui/shop/ui/shop_screen.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin{
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
        builder: (obj) => Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustAppBar(
            seconds: 120,
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
            minimum: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Obx(
              () => Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: _controller
                          .currQuiz[_controller.currQuestionIndex.value]
                          .question,
                      style: AppTypography.mainStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
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
                      state: _controller.answersState[i],
                      onTap: () async => _controller.lock.value
                          ? null
                          : await _controller
                              .onAnswerChosen(selectedIndx: i)
                              .then((value) async =>
                                  await _controller.nextQuestion()),
                    ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Easy level',
                                style: AppTypography.mainStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              const RotatedBox(
                                quarterTurns: -1,
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            '${_controller.currQuestionIndex + 1}/${_controller.currQuiz.value.length}',
                            style: AppTypography.mainStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 32.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const HelperWidget(
                        label: '75/25',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: HelperWidget(
                          label: '50/50',
                        ),
                      ),
                      const HelperWidget(
                        label: 'SHOW',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

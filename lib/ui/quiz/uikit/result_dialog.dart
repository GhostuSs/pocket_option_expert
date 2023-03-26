import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';

import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/uikit/main_button.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({
    Key? key,
    required this.scores,
    required this.wonSum,
  }) : super(key: key);
  final int scores;
  final int wonSum;
  @override
  Widget build(BuildContext context) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 5,
        sigmaX: 5,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: _StarsWidget(
                      scores: scores,
                    ),
                  ),
                  Text(
                    '$scores/8',
                    style: AppTypography.mainStyle.copyWith(
                      fontSize: 72.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: '+$wonSum ',
                        style: AppTypography.mainStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                          color: AppColors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Coins',
                            style: AppTypography.mainStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                              color: AppColors.blue,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              MainButton(
                  label: 'Play Again',
                  onTap: () {
                    //TODO:Implement
                    debugPrint('implement');
                  })
            ],
          ),
        ),
      ));
}

class _StarsWidget extends StatelessWidget {
  const _StarsWidget({
    Key? key,
    required this.scores,
  }) : super(key: key);
  final int scores;

  IconData _icSelector({required bool truCond, required bool halv}) {
    final bool trueCond = truCond;
    final bool half = halv;
    return trueCond
        ? Icons.star_rounded
        : half
            ? Icons.star_half_rounded
            : Icons.star_border_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final _size = 95.sp;
    return Container(
      constraints: BoxConstraints.expand(
        height: 130.h,
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                _icSelector(
                    truCond: scores >= 2, halv: scores < 2 && scores > 0),
                color: AppColors.yellow,
                size: _size,
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Icon(
                _icSelector(
                    truCond: scores > 4, halv: scores > 2 && scores <= 4),
                color: AppColors.yellow,
                size: _size,
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                _icSelector(
                    truCond: scores == 8, halv: scores > 5 && scores <= 7),
                color: AppColors.yellow,
                size: _size,
              )),
        ],
      ),
    );
  }
}

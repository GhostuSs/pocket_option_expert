import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class QuizButton extends StatelessWidget {

  const QuizButton({
    Key? key,
    required this.label,
    required this.state,
    required this.onTap, required this.locker,
  }) : super(key: key);
  final String label;
  final AnswerState state;
  final VoidCallback onTap;
  final bool locker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.h,
      ),
      child: InkWell(
        onTap: state == AnswerState.disabled ? null : onTap,
        borderRadius: BorderRadius.circular(
          100.r,
        ),
        child: Opacity(
          opacity: _stateOpacity(),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1.5,
                    color: locker ? AppColors.green : Colors.transparent,
                  )
                ),
                child: Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100.r,
                    ),
                    color: _colorSelector(),
                    border: Border.all(
                      color: AppColors.blue.withOpacity(
                        0.3,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: AppTypography.mainStyle.copyWith(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _stateOpacity() {
    return state == AnswerState.disabled ? 0.3 : 1.0;
  }

  Color _colorSelector() {
    switch (state) {
      case AnswerState.wrong:
        return AppColors.red;
      case AnswerState.correct:
        return AppColors.green;
      default:
        return AppColors.white.withOpacity(0.1);
    }
  }
}

enum AnswerState {
  active,
  disabled,
  wrong,
  correct,
}

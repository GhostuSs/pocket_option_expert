// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class PayWallBadge extends StatelessWidget {
  final String label;
  final Color color;

  const PayWallBadge({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints.expand(width: 190.w, height: 40.h),
        decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(99.r),
            border: Border.all(color: color, width: 0.5)),
        child: Center(
          child: Text(
            label,
            style: AppTypography.mainStyle.copyWith(
              fontSize: 14.w,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      );
}

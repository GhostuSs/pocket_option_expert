// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const MainButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(99),
        child: Container(
          constraints: BoxConstraints.expand(height: 56.h),
          decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue.withOpacity(0.2),
                  spreadRadius: 4.r,
                  blurRadius: 22.r,
                )
              ]),
          child: Center(
            child: Text(
              label,
              style: AppTypography.mainStyle.copyWith(
                fontSize: 18.w,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      );
}

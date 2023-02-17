import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class DiffButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const DiffButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context)=>InkWell(
    onTap: onTap,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    borderRadius: BorderRadius.circular(99.r),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.w,sigmaY: 3.h),
        child: Container(
          constraints: BoxConstraints.expand(height: 60.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 7.h),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue),
              borderRadius: BorderRadius.circular(99.r),
              color: AppColors.white.withOpacity(0.1)
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(99.r)
            ),
            child: Center(
              child: Text(label,style: AppTypography.mainStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15.w,
                color: AppColors.white,
              ),),
            ),
          ),
        ),
      ),
    ),
  );
}

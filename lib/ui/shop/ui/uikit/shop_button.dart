import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.description,
    required this.price,
  }) : super(key: key);
  final VoidCallback onTap;
  final String label;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8,),
          child: Container(
            constraints: BoxConstraints.expand(height: 120.h),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              border: Border.all(
                color: AppColors.blue.withOpacity(0.3),
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  constraints: BoxConstraints.expand(width: 85.w,height: 38.h,),
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.blue,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: AppTypography.mainStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 8,
                  ),
                  child: Text(
                    description,
                    style: AppTypography.mainStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.5)),
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: price.toString(),
                        style: AppTypography.mainStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.white,
                        ),
                        children: [
                      TextSpan(
                        text: 'Coins',
                        style: AppTypography.mainStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColors.blue,
                        ),
                      )
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

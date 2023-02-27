import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.label, required this.points}) : super(key: key);
  final String label;
  final int points;

  @override
  Widget build(BuildContext context)=>Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.blue,),
      borderRadius: BorderRadius.circular(99),
      color: AppColors.white.withOpacity(0.09)
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaY: 6,sigmaX: 6),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 46.h,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Center(
                  child: Text(label,style: AppTypography.mainStyle.copyWith(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$points/8',style: AppTypography.mainStyle.copyWith(
                    fontSize: 15.5.w,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),),
                  SizedBox(width: 10.w,),
                  SimpleStarRating(rating: points.toDouble(),
                    starCount: 3,
                    size: 16.w,
                    spacing: 4.w,
                    filledIcon: SvgPicture.asset('assets/images/starfilled.svg'),
                      nonFilledIcon: SvgPicture.asset('assets/images/staroutlined.svg'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

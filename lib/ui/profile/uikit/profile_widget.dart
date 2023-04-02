import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
//TODO: Correct
class QuizHistoryCard extends StatelessWidget {
  const QuizHistoryCard({
    Key? key,
    required this.label,
    required this.points,
    this.preLast,
  }) : super(key: key);
  final String label;
  final int points;
  final int? preLast;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.blue,
          ),
          borderRadius: BorderRadius.circular(99),
          color: AppColors.white.withOpacity(0.09),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaY: 6, sigmaX: 6),
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$points/8',
                            style: AppTypography.mainStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                            ),
                          ),
                          if (preLast != null)
                            Text(
                              '${preLast == 0 ? preLast : preLast!}/8',
                              style: AppTypography.mainStyle.copyWith(
                                fontSize: 16.sp,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white.withOpacity(0.3),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SimpleStarRating(
                        rating: (points/8)*3.toDouble(),
                        starCount: 3,
                        size: 16.w,
                        spacing: 4.w,
                        filledIcon:
                            SvgPicture.asset('assets/images/starfilled.svg'),
                        nonFilledIcon:
                            SvgPicture.asset('assets/images/staroutlined.svg'),
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

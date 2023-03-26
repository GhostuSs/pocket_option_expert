import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class HelperWidget extends StatelessWidget {
  final String label;

  const HelperWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('impl onPressed');
        }
      },
      child: Container(
        constraints: BoxConstraints.expand(
          width: 60.sp,
          height: 60.sp,
        ),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
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
    );
  }
}

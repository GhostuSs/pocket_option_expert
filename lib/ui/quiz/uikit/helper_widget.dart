import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class HelperWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const HelperWidget({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints.expand(
          width: 58.sp,
          height: 58.sp,
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

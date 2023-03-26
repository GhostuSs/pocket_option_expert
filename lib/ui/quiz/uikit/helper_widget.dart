import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class HelperWidget extends StatelessWidget {

  const HelperWidget({Key? key, required this.label, this.onTap}) : super(key: key);
  final String label;
  final VoidCallback? onTap;

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

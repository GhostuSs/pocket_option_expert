import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class CustAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustAppBar({
    super.key,
    this.showLabels,
    this.seconds,
    this.action,
    this.leading,
  });

  final bool? showLabels;
  final Widget? leading;
  final Widget? action;
  final int? seconds;

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: showLabels == true
                ? Center(
                    child: RichText(
                        text: TextSpan(
                            text: seconds.toString(),
                            style: AppTypography.mainStyle.copyWith(
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                            children: [
                              TextSpan(
                                text: ' Sec',
                                style: AppTypography.mainStyle.copyWith(
                                  fontSize: 16.5.w,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.withOpacity(0.5),
                                ),
                              ),
                            ]),),
                  )
                : leading != null
                    ? leading!
                    : null,
            leadingWidth: 80.w,
            actions: [
              Container(
                    constraints:
                        BoxConstraints.expand(width: 56.w, height: 56.w),
                    child: Center(
                      child: action,
                    ),
                  ) ??
                  const SizedBox.shrink()
            ],
            backgroundColor: const Color.fromRGBO(18, 28, 35, 0.1),
            title: RichText(
                text: TextSpan(
                    text: (Hive.box<UserModel>('user').values.first.balance??1000).toString(),
                    style: AppTypography.mainStyle.copyWith(
                        fontSize: 17.w,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                      text: ' coins',
                      style: AppTypography.mainStyle.copyWith(
                          fontSize: 17.w,
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400))
                ])),
          ),
        ),
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50.h);
}

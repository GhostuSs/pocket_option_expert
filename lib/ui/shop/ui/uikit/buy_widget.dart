import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';

class BuyWidget extends StatelessWidget {
  const BuyWidget({
    Key? key,
    required this.quantity,
    required this.increment,
    required this.decrement,
  }) : super(key: key);
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AdditionalButton(
          onTap: decrement,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _AdditionalButton(
            onTap: increment,
            isIncrement: true,
          ),
        ),
        _BuyButton(onTap: () {}, quantity: quantity)
      ],
    );
  }
}

class _AdditionalButton extends StatefulWidget {
  const _AdditionalButton({
    required this.onTap,
    this.isIncrement,
  });

  final VoidCallback onTap;
  final bool? isIncrement;

  @override
  State<StatefulWidget> createState() => _AdditionalButtonState();
}

class _AdditionalButtonState extends State<_AdditionalButton> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: () =>
          timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        widget.onTap();
      }),
      onLongPressEnd: (det) => timer?.cancel(),
      child: Container(
        constraints: BoxConstraints.expand(width: 64.w, height: 64.w),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                widget.isIncrement == true ? AppColors.green : AppColors.red),
        child: Center(
          child: Text(
            widget.isIncrement == true ? '+' : '-',
            style: AppTypography.mainStyle.copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({
    Key? key,
    required this.onTap,
    required this.quantity,
  }) : super(key: key);
  final VoidCallback onTap;
  final int quantity;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          width: 170.w,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: Text(
              'Buy — $quantity',
              style: AppTypography.mainStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  color: AppColors.white),
            ),
          ),
        ),
      );
}

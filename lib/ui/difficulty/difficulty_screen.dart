import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';
import 'package:pocket_option_expert/ui/settings/uikit/difficulty.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class DifficultyScreen extends StatefulWidget {
  const DifficultyScreen({Key? key}) : super(key: key);

  @override
  State<DifficultyScreen> createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  int currInd = 0;
  int currLevel = 0;
  @override
  Widget build(BuildContext context)=>Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustAppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
        child: Column(
          children: [
            DiffButton(label: 'EASY', onTap: (){},),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: DiffButton(label: 'NORMAL', onTap: (){}),
            ),
            DiffButton(label: 'HARD', onTap: (){}),
          ],
        ),
      ),
    ),
  );
  Color selector(bool isSelected) {
    return isSelected ? AppColors.blue : AppColors.blue.withOpacity(0.5);
  }
}

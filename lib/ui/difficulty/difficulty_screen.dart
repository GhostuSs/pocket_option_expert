import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';
import 'package:pocket_option_expert/ui/settings/uikit/difficulty.dart';

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
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            selectedItemColor: AppColors.blue,
            currentIndex: currInd,
            onTap: (ind) => setState(() => currInd = ind),
            backgroundColor: const Color.fromRGBO(18, 28, 35, 0.3),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/quiz.svg',
                  color: selector(currInd == 0),
                ),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/profile.svg',
                  color: selector(currInd == 1),
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/settings.svg',
                  color: selector(currInd == 2),
                ),
                label: 'Settings',
              ),
            ],
            selectedLabelStyle: AppTypography.mainStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 10.w,
                color: AppColors.blue),
          ),
        ),
      ),
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

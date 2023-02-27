// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/profile/ui/profile_screen.dart';
import 'package:pocket_option_expert/ui/quiz/quiz_screen.dart';
import 'package:pocket_option_expert/ui/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currInd = 0;
  List<Widget> screens = [
    const QuizScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: currInd!=0 ? CustAppBar() : null,
          bottomNavigationBar: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                selectedItemColor: AppColors.blue,
                currentIndex: currInd,
                onTap: (ind) => setState(() => currInd = ind),
                backgroundColor: Color.fromRGBO(18, 28, 35, 0.3),
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
            child: screens[currInd],
          ),
        ),
      );

  Color selector(bool isSelected) {
    return isSelected ? AppColors.blue : AppColors.blue.withOpacity(0.5);
  }
}

class CustAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustAppBar({super.key, this.showLabels, this.seconds});
  final bool? showLabels;
  final int? seconds;

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: showLabels==true ? RichText(text: TextSpan(text: seconds.toString(),style: AppTypography.mainStyle.copyWith(
  fontSize: 16.5.w,
  fontWeight: FontWeight.w500,
  color: AppColors.white,
  ),children: [
              TextSpan(text: 'Sec',style: AppTypography.mainStyle.copyWith(
  fontSize: 16.5.w,
  fontWeight: FontWeight.w500,
  color: AppColors.white.withOpacity(0.5),
  ),),
            ])) :null,
            backgroundColor: Color.fromRGBO(18, 28, 35, 0.3),
            title: RichText(
                text: TextSpan(
                    text: '199',
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

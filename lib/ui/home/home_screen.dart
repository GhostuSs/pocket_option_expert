import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currInd = 0;
  List<Widget> screens = [
    Column(),
    Column(),
    SettingsScreen(),
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
          appBar: CustAppBar(),
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
  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AppBar(
            automaticallyImplyLeading: false,
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

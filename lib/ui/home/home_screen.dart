import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/profile/ui/profile_screen.dart';
import 'package:pocket_option_expert/ui/quiz/quiz_screen.dart';
import 'package:pocket_option_expert/ui/settings/settings_screen.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const QuizScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  final PersistentTabController persController = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: persController.index != 0 ? const CustAppBar() : null,
          body: PersistentTabView.custom(
            context,
            backgroundColor: const Color.fromRGBO(
              18,
              28,
              35,
              0.3,
            ),
            screens: screens,
            controller: persController,
            customWidget: (c) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBtmWidget(
                    onTap: () => persController.jumpToTab(0),
                    path: 'assets/images/quiz.svg',
                    selected: persController.index == 0,
                    label: 'Quiz',
                  ),
                  CustomBtmWidget(
                    onTap: () => persController.jumpToTab(1),
                    path: 'assets/images/profile.svg',
                    selected: persController.index == 1,
                    label: 'Profile',
                  ),
                  CustomBtmWidget(
                    onTap: () => persController.jumpToTab(2),
                    path: 'assets/images/settings.svg',
                    selected: persController.index == 2,
                    label: 'Settings',
                  ),
                ],
              ),
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}

class CustomBtmWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String path;
  final bool selected;
  final String label;
  const CustomBtmWidget({
    Key? key,
    required this.onTap,
    required this.path,
    required this.selected,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            path,
            color: selector(selected),
          ),
          if (selected)
            SizedBox(
              height: 6.sp,
            ),
          if (selected)
            Text(
              label,
              style: AppTypography.mainStyle.copyWith(
                fontSize: 12.sp,
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
              ),
            )
        ],
      ),
    );
  }

  Color selector(bool isSelected) {
    return isSelected ? AppColors.blue : AppColors.blue.withOpacity(0.5);
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
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
  Widget build(BuildContext context) => BackdropFilter(
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
            // bottomNavigationBar: ClipRRect(
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //     child: BottomNavigationBar(
            //       showUnselectedLabels: false,
            //       selectedItemColor: AppColors.blue,
            //       currentIndex: persController.index,
            //       onTap: (ind) => setState(() => persController.index = ind),
            //       backgroundColor: Color.fromRGBO(18, 28, 35, 0.3),
            //       items: [
            //         BottomNavigationBarItem(
            //           icon: SvgPicture.asset(
            //             'assets/images/quiz.svg',
            //             color: selector(persController.index == 0),
            //           ),
            //           label: 'Quiz',
            //         ),
            //         BottomNavigationBarItem(
            //           icon: SvgPicture.asset(
            //             'assets/images/profile.svg',
            //             color: selector(persController.index == 1),
            //           ),
            //           label: 'Profile',
            //         ),
            //         BottomNavigationBarItem(
            //           icon: SvgPicture.asset(
            //             'assets/images/settings.svg',
            //             color: selector(persController.index == 2),
            //           ),
            //           label: 'Settings',
            //         ),
            //       ],
            //       selectedLabelStyle: AppTypography.mainStyle.copyWith(
            //           fontWeight: FontWeight.w500,
            //           fontSize: 10.w,
            //           color: AppColors.blue),
            //     ),
            //   ),
            // ),
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
                    InkWell(
                      onTap: () => persController.jumpToTab(0),
                      child: SvgPicture.asset(
                        'assets/images/quiz.svg',
                        color: selector(persController.index == 0),
                      ),
                    ),
                    InkWell(
                        onTap: () => persController.jumpToTab(1),
                        child: SvgPicture.asset(
                          'assets/images/profile.svg',
                          color: selector(persController.index == 1),
                        )),
                    InkWell(
                      onTap: () => persController.jumpToTab(2),
                      child: SvgPicture.asset(
                        'assets/images/settings.svg',
                        color: selector(persController.index == 2),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: 3,
            ),
          ),
        ),
      );

  Color selector(bool isSelected) {
    return isSelected ? AppColors.blue : AppColors.blue.withOpacity(0.5);
  }
}

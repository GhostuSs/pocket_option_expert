// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pocket_option_expert/res/apptypography.dart';
import 'package:pocket_option_expert/res/base_urls.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';
import 'package:pocket_option_expert/ui/paywall/uikit/paywall_badge.dart';
import 'package:pocket_option_expert/ui/uikit/main_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/paywall.png')
      )
    ),
    child: Scaffold(
      backgroundColor: AppColors.bgGray.withOpacity(0.3),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 14.w,vertical: 28.h),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: ()=>Navigator.push(context, PageTransition<Widget>(child: HomeScreen(),type: PageTransitionType.rightToLeft)),
                child: Icon(Icons.clear,color: AppColors.white,),
              ),
            ),
            Align(child: SizedBox(
              height: 100.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: PayWallBadge(label: 'All Quizes', color: AppColors.green),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PayWallBadge(label: 'Removing ADS', color: AppColors.red),
                  ),
                ],
              ),
            ),),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MainButton(label: r'Get premium for $0.99', onTap: ()async{
                    await Hive.box<bool>('premium').put('premium',true);
                    Navigator.push(context, PageTransition<Widget>(child: HomeScreen(),type: PageTransitionType.rightToLeft,));
                  }),
                SizedBox(height: 24.h,),
                Padding(
                padding:EdgeInsets.symmetric(horizontal:5.w),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                onTap:()=>launchUrlString(BaseUrls.terms),
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Text('Terms of Use',style: AppTypography.mainStyle.copyWith(
                              fontWeight:FontWeight.w300,
                              fontSize:12.w,
                              color:AppColors.white.withOpacity(0.7)
                          ),),
                        ),
                        InkWell(
                          onTap:(){},
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Text('Restore',style: AppTypography.mainStyle.copyWith(
                              fontWeight:FontWeight.w300,
                              fontSize:12.w,
                              color:AppColors.white.withOpacity(0.7)
                          ),),
                        ),
                        InkWell(
                          onTap:()=>launchUrlString(BaseUrls.privacy),
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Text('Privacy Policy',style: AppTypography.mainStyle.copyWith(
                              fontWeight:FontWeight.w300,
                              fontSize:12.w,
                              color:AppColors.white.withOpacity(0.7)
                          ),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    ),
  );
}

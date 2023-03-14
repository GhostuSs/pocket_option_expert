import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/res/app_theme.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';
import 'package:pocket_option_expert/ui/paywall/paywall.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>ScreenUtilInit(builder: (_,widget)=>GetMaterialApp(
    theme: AppTheme.mainTheme,
    home: Hive.box<bool>('premium').values.first==true ? const HomeScreen() :const PaywallScreen(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_option_expert/ui/paywall/paywall.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>ScreenUtilInit(builder: (_,widget)=>MaterialApp(
    home: PaywallScreen(),
  ));
}

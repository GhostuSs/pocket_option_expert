import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pocket_option_expert/res/base_urls.dart';
import 'package:pocket_option_expert/ui/paywall/paywall.dart';
import 'package:pocket_option_expert/ui/settings/uikit/difficulty.dart';
import 'package:pocket_option_expert/ui/settings/uikit/setting_button.dart';
import 'package:pocket_option_expert/ui/uikit/main_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
    child: Column(
      children: [
        MainButton(label: 'GET PREMIUM FOR \$0.99', onTap: ()=>Navigator.push(context, PageTransition<Widget>(child:PaywallScreen(),type:PageTransitionType.rightToLeft))),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              SettingButton(label: 'Terms of Use', onTap: ()=>launchUrlString(BaseUrls.terms),width: 155.w,),
              SizedBox(width: 20.w,),
              SettingButton(label: 'Privacy Policy', onTap: ()=>launchUrlString(BaseUrls.privacy),width: 155.w,),
            ],
          ),
        ),
        SettingButton(label: 'Support', onTap: ()=>launchUrlString(BaseUrls.support)),
        SizedBox(height: 23,),
        DiffButton(label: 'CHOICE OF DIFFICULTY LEVEL', onTap: (){})
      ],
    ),
  );
}

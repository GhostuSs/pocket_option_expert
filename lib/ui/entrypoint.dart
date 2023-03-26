import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/res/app_theme.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';
import 'package:pocket_option_expert/ui/paywall/paywall.dart';
import 'package:pocket_option_expert/ui/profile/profile_controller/profile_controller.dart';
import 'package:pocket_option_expert/ui/quiz/state/quiz_controller.dart';
import 'package:pocket_option_expert/ui/quiz/uikit/result_dialog.dart';
import 'package:pocket_option_expert/ui/shop/state/shop_controller.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        builder: (_, widget) => GetMaterialApp(
          theme: AppTheme.mainTheme,
          initialBinding: BindingsBuilder<GetxController>((){
            Get
              ..lazyPut<ShopController>(ShopController.new, fenix: true)
              ..lazyPut<ProfileController>(ProfileController.new, fenix: true)
              ..lazyPut<QuizController>(QuizController.new, fenix: true);
          }),
          home:
          Hive.box<bool>('premium').values.first == true
              ? const HomeScreen()
              : const PaywallScreen(),
        ),
      );
}

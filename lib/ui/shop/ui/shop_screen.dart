import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/shop/state/shop_controller.dart';
import 'package:pocket_option_expert/ui/shop/ui/uikit/buy_widget.dart';
import 'package:pocket_option_expert/ui/shop/ui/uikit/shop_button.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopController>();
    return GetBuilder(
      init: controller,
      dispose: (cnt) => controller.clear(),
      builder: (cntroller) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: CustAppBar(
            leading: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.clear,
                    size: 20.h,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24.h,
            ),
            child: Column(
              children: [
                Obx(
                  () => ShopButton(
                    onTap: controller.onRemIncorrectTap,
                    label: '75/25',
                    isSelected: controller.removeInc.value > 0,
                    description: 'Removes 1 incorrect answer',
                    price: controller.removeInc.value > 1
                        ? controller.removeInc.value * 70
                        : 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Obx(() => ShopButton(
                        onTap: controller.onFiftyFiftyTap,
                        isSelected: controller.fiftyFifty.value > 0,
                        label: '50/50',
                        description: 'Removes 2 incorrect answers',
                        price: controller.fiftyFifty.value > 1
                            ? controller.fiftyFifty.value * 100
                            : 100,
                      )),
                ),
                Obx(
                  () => ShopButton(
                    onTap: controller.onShowTap,
                    label: 'SHOW',
                    isSelected: controller.show.value > 0,
                    description: 'Shows the correct answer',
                    price: controller.show.value > 1
                        ? controller.show.value * 300
                        : 300,
                  ),
                ),
                const Spacer(),
                Obx(() => controller.anyChosen()
                    ? BuyWidget(
                        quantity: controller.quantity(),
                        increment: controller.increment,
                        decrement: controller.decrement,
                      )
                    : const SizedBox.shrink()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

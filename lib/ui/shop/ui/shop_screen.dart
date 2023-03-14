import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pocket_option_expert/res/colors.dart';
import 'package:pocket_option_expert/ui/shop/ui/uikit/shop_button.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/images/bg.png'),
    fit: BoxFit.fill
    ),),
      child: Scaffold(
        appBar: CustAppBar(
          leading: Row(
            children: [
              const SizedBox(width: 20,),
              InkWell(
                onTap: ()=>Get.back<void>(),
                child: Icon(Icons.clear,size:20.h,color: AppColors.white,),
              )
            ],
          ),
        ),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16,vertical: 24.h,),
          child: Column(children: [
            ShopButton(
              onTap: (){}, label: '75/25', description: 'Removes 1 incorrect answer', price: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: ShopButton(
                onTap: (){}, label: '75/25', description: 'Removes 1 incorrect answer', price: 70,
              ),
            ),
            ShopButton(
              onTap: (){}, label: '75/25', description: 'Removes 1 incorrect answer', price: 70,
            ),
            const Spacer(),
            Row(children: const [
              //TODO:Implement buy widget
            ],)
        ],),),
      ),
    );
  }
}

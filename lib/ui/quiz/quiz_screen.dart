import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';
import 'package:pocket_option_expert/ui/shop/ui/shop_screen.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context)=>
  Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.fill
      ),
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: CustAppBar(
      seconds: 120,
      showLabels: true,
      action: InkWell(
        onTap: ()=>Get.to<void>(()=>ShopScreen()),
        child: Center(
          child: SvgPicture.asset('assets/images/shop.svg'),
        ),
      ),
    ),
    body: SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 0,vertical: 32),
      child: Column(
        children: [
          Text('123123123123123123')
        ],
      ),
    ),
  ),
  );
}

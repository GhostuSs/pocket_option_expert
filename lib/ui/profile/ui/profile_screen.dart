import 'package:flutter/material.dart';
import 'package:pocket_option_expert/ui/profile/uikit/profile_widget.dart';
import 'package:pocket_option_expert/ui/uikit/cust_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        appBar:const CustAppBar(),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: const [
              ProfileWidget(label: 'EASY QUIZ', points: 0),
            ],
          ),
        ),
      ),
    )
      ;
  }
}

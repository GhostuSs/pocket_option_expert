import 'package:flutter/material.dart';
import 'package:pocket_option_expert/ui/profile/uikit/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: const [
            ProfileWidget(label: 'EASY QUIZ', points: 0),
          ],
        ),
      ),
    );
  }
}

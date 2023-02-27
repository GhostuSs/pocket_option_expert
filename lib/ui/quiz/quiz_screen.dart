import 'package:flutter/material.dart';
import 'package:pocket_option_expert/ui/home/home_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context)=>Scaffold(
    // appBar: const CustAppBar(
    //   seconds: 120,
    //   showLabels: true,
    // ),
    body: SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 0,vertical: 32),
      child: Column(
        children: [

        ],
      ),
    ),
  );
}

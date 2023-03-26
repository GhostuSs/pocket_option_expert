import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket_option_expert/domain/models/quiz_history/quiz_his_model.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/ui/entrypoint.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive..registerAdapter<UserModel>(UserModelAdapter(),)
  ..registerAdapter<QuizHistory>(QuizHistoryAdapter(),);
  await Hive.openBox<bool>('paywall');
  await Hive.openBox<bool>('premium');
  await Hive.openBox<UserModel>('user');
  // await Hive.box<UserModel>('user').clear();
  if (Hive.box<bool>('premium').isEmpty == true) {
    await Hive.box<bool>('premium').put('premium', false);
  }
  if (Hive.box<bool>('paywall').isEmpty == true) {
    await Hive.box<bool>('paywall').put('paywall', false);
  }
  if (Hive.box<UserModel>('user').isEmpty) {
    final _newUser=UserModel(
      difficultyLevel: 'easy',
      fiftyFifty: 0,
      removeInc: 0,
      show: 0,
      balance: 1000,
      easy: QuizHistory(name: 'easy',currRes: 0),
      normal: QuizHistory(name: 'normal',currRes: 0),
      hard: QuizHistory(name: 'hard',currRes: 0),
    );
    await Hive.box<UserModel>('user').put(
      'user',
      _newUser,
    );
  }
  runApp(
    const EntryPoint(),
  );
}

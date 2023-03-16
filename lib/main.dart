import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/ui/entrypoint.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<bool>('paywall');
  await Hive.openBox<bool>('premium');
  await Hive.openBox<UserModel>('user');
  if (Hive.box<bool>('premium').isEmpty == true) {
    await Hive.box<bool>('premium').put('premium', false);
  }
  if (Hive.box<bool>('paywall').isEmpty == true) {
    await Hive.box<bool>('paywall').put('paywall', false);
  }
  if (Hive.box<UserModel>('user').isEmpty) {
    await Hive.box<UserModel>('user').put(
      'user',
      UserModel(
        difficultyLevel: 'easy',
        fiftyFifty: 0,
        removeInc: 0,
        show: 0,
      ),
    );
  }
  runApp(
    const EntryPoint(),
  );
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocket_option_expert/ui/entrypoint.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('paywall');
  await Hive.openBox<bool>('premium');
  if(Hive.box<bool>('premium').isEmpty==true)await Hive.box<bool>('premium').put('premium', false);
  if(Hive.box<bool>('paywall').isEmpty==true)await Hive.box<bool>('paywall').put('paywall', false);
  runApp(const EntryPoint(),);
}
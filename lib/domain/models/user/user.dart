import 'package:hive/hive.dart';
import 'package:pocket_option_expert/domain/models/quiz_history/quiz_his_model.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  UserModel({
    this.difficultyLevel,
    this.fiftyFifty,
    this.removeInc,
    this.show,
    this.easy,
    this.normal,
    this.hard,
    this.balance,
  });

  @HiveField(0)
  String? difficultyLevel;
  @HiveField(1)
  int? show;
  @HiveField(2)
  int? fiftyFifty;
  @HiveField(3)
  int? removeInc;
  @HiveField(4)
  QuizHistory? easy;
  @HiveField(5)
  QuizHistory? normal;
  @HiveField(6)
  QuizHistory? hard;
  @HiveField(7)
  int? balance;
}

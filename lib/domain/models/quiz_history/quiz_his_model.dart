import 'package:hive/hive.dart';

part 'quiz_his_model.g.dart';

@HiveType(typeId: 2)
class QuizHistory extends HiveObject {
  QuizHistory({
    this.name,
    this.currRes,
    this.prelastRes,
  });

  @HiveField(0)
  final String? name;
  @HiveField(1)
  final int? currRes;
  @HiveField(2)
  final int? prelastRes;
}

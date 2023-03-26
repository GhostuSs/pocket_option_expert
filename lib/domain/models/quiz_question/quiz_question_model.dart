import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_question_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class QuizQuestion extends HiveObject {
  QuizQuestion({
    this.question,
    this.correct,
    this.answers,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
  @HiveField(0)
  String? question;
  @HiveField(1)
  int? correct;
  @HiveField(2)
  List<String>? answers;

  Map<String, dynamic> toJson() => _$QuizQuestionToJson(this);
}

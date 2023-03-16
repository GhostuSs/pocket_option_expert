// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      difficultyLevel: fields[0] as String?,
      fiftyFifty: fields[2] as int?,
      removeInc: fields[3] as int?,
      show: fields[1] as int?,
      easy: fields[4] as QuizHistory?,
      normal: fields[5] as QuizHistory?,
      hard: fields[6] as QuizHistory?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.difficultyLevel)
      ..writeByte(1)
      ..write(obj.show)
      ..writeByte(2)
      ..write(obj.fiftyFifty)
      ..writeByte(3)
      ..write(obj.removeInc)
      ..writeByte(4)
      ..write(obj.easy)
      ..writeByte(5)
      ..write(obj.normal)
      ..writeByte(6)
      ..write(obj.hard);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

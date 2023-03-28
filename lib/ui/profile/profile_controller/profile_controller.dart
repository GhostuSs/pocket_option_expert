import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';

class ProfileController extends GetxController {
  var userData = Hive.box<UserModel>('user').values.first.obs;

  void updateProfile({required UserModel user}){
    Hive.box<UserModel>('user').put('user', user);
    userData.value=user;
  }
}

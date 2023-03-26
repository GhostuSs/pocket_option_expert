import 'package:get/get.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:hive/hive.dart';

class ProfileController extends GetxController {
  var userData = Hive.box<UserModel>('user').values.first.obs;

  void updateProfile(){
    userData.value=Hive.box<UserModel>('user').values.first;
  }
}

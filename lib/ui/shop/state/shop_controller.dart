import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pocket_option_expert/domain/models/user/user.dart';
import 'package:pocket_option_expert/ui/quiz/state/quiz_controller.dart';

class ShopController extends GetxController {
  var fiftyFifty = 0.obs;
  var show = 0.obs;
  var removeInc = 0.obs;
  var cost = 0.obs;
  var user = Hive.box<UserModel>('user').values.first.obs;

  void decrement() {
    if (fiftyFifty.value > 0) fiftyFifty.value--;
    if (show.value > 0) show.value--;
    if (removeInc.value > 0) removeInc.value--;
  }

  void increment() {
    if (fiftyFifty.value > 0) {
      fiftyFifty.value++;
      cost.value+=100;
    }
    if (show.value > 0) {
      show.value++;
      cost.value+=300;
    }
      if (removeInc.value > 0){
        removeInc.value++;
        cost.value+=70;
      }
    }

  void onRemIncorrectTap() {
    cost.value=70;
    fiftyFifty.value = 0;
    show.value = 0;
    removeInc.value = 1;
  }

  void onFiftyFiftyTap() {
    cost.value=100;
    fiftyFifty.value = 1;
    show.value = 0;
    removeInc.value = 0;
  }

  void onShowTap() {
    cost.value=300;
    fiftyFifty.value = 0;
    show.value = 1;
    removeInc.value = 0;
  }

  bool anyChosen() {
    return fiftyFifty.value > 0 || removeInc.value > 0 || show.value > 0;
  }

  void clear() {
    fiftyFifty.value = 0;
    show.value = 0;
    removeInc.value = 0;
  }

  Future<void> buy() async {
    final _user = Hive.box<UserModel>('user').values.first;
    if((_user.balance)!>=cost.value){
      _user..balance=(_user.balance)!-cost.value
      ..fiftyFifty=_user.fiftyFifty!+fiftyFifty.value
      ..removeInc=_user.removeInc!+removeInc.value
      ..show=_user.show!+show.value;
    }
    await Hive.box<UserModel>('user').put('user', _user);
    clear();
    Get.find<QuizController>().userData.value=Hive.box<UserModel>('user').values.first;
  }

  int quantity() => fiftyFifty.value + removeInc.value + show.value;
}

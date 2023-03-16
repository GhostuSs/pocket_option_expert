import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  var fiftyFifty = 0.obs;
  var show = 0.obs;
  var removeInc = 0.obs;

  void decrement() {
    if (fiftyFifty.value > 0) fiftyFifty.value--;
    if (show.value > 0) show.value--;
    if (removeInc.value > 0) removeInc.value--;
  }

  void increment() {
    if (fiftyFifty.value > 0) fiftyFifty.value++;
    if (show.value > 0) show.value++;
    if (removeInc.value > 0) removeInc.value++;
  }

  void onRemIncorrectTap() {
    fiftyFifty.value = 0;
    show.value = 0;
    removeInc.value = 1;
  }

  void onFiftyFiftyTap() {
    fiftyFifty.value = 1;
    show.value = 0;
    removeInc.value = 0;
  }

  void onShowTap() {
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

  int quantity() => fiftyFifty.value + removeInc.value + show.value;
}

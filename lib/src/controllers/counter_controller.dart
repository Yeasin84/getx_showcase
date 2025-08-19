import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
  void decrement() => count.value--;

  // For GetBuilder demo (non-reactive), we call update() manually:
  int taps = 0;
  void registerTap() {
    taps++;
    update(); // triggers GetBuilder rebuilds only
  }
}

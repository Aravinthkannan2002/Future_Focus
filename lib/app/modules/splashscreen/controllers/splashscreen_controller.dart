import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
    void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/onboardingscreen'); // Replace '/home' with your desired route
    });
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

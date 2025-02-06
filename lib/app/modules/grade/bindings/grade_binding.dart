import 'package:get/get.dart';

import '../controllers/grade_controller.dart';

class GradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GradeController>(
      () => GradeController(),
    );
  }
}

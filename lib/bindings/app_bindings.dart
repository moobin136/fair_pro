import 'package:fair_pro/controllers/app_controller.dart';
import 'package:get/get.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }
}

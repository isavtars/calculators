import 'package:get/instance_manager.dart';
import '../controller/calculators_controllers.dart';
import '../controller/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => CalculateController());
  }
}

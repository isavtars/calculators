import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDark = true;

  lightThem() {
    isDark = false;
    update();
  }

  darkThem() {
    isDark = true;
    update();
  }
}

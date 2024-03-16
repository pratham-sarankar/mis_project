import 'package:get/get.dart';

class Toast {
  static void showError(String error) {
    Get.snackbar(
      'Error',
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

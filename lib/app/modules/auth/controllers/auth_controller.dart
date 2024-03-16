import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/repositories/auth_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class AuthController extends GetxController {
  late RxBool isLoading;
  late GlobalKey<FormState> formKey;
  late TextEditingController phoneNumberController;

  @override
  void onInit() {
    isLoading = false.obs;
    formKey = GlobalKey<FormState>();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  void onProceed() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        final verificationToken =
            await Get.find<AuthRepository>().login(phoneNumberController.text);
        print("The verification token is $verificationToken");
        isLoading.value = false;
        Get.toNamed('/otp', arguments: {
          "phoneNumber": phoneNumberController.text,
          "verificationToken": verificationToken,
        });
      }
    } catch (e) {
      isLoading.value = false;
      Toast.showError(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() {}
}

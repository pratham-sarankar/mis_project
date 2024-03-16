import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/repositories/auth_repository.dart';
import 'package:mis_project/app/data/utils/enums/otp_status.dart';
import 'package:mis_project/app/data/utils/toast.dart';
import 'package:mis_project/app/routes/app_pages.dart';

class OtpController extends GetxController {
  late String phoneNumber;
  late RxBool isLoading;
  late String verificationToken;
  late RxInt resentOTPTime;
  late Rx<OTPStatus> otpStatus;
  late TextEditingController otpController;

  @override
  void onInit() {
    phoneNumber = Get.arguments['phoneNumber']!;
    verificationToken = Get.arguments['verificationToken']!;
    resentOTPTime = 0.obs;
    otpStatus = OTPStatus.sent.obs;
    otpController = TextEditingController();
    isLoading = false.obs;
    startTimer();
    super.onInit();
  }

  void startTimer() {
    otpStatus.value = OTPStatus.sent;
    resentOTPTime.value = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resentOTPTime > 0) {
        resentOTPTime.value--;
      } else {
        otpStatus.value = OTPStatus.canResend;
        timer.cancel();
      }
    });
  }

  void resentOTP() async {
    try {
      otpStatus.value = OTPStatus.resending;
      verificationToken =
          await Get.find<AuthRepository>().resendOTP(verificationToken);
      otpStatus.value = OTPStatus.sent;
      startTimer();
    } catch (e) {
      Toast.showError(e.toString());
    }
  }

  void verifyOTP() async {
    try {
      isLoading.value = true;
      final response = await Get.find<AuthRepository>()
          .verifyOTP(verificationToken, otpController.text);
      isLoading.value = false;
      if (response.isNewUser) {
        Get.toNamed(Routes.COMPANY_FORM);
      } else {
        Get.offAllNamed(Routes.HOME);
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

  String get formattedOTPTime {
    final min = (resentOTPTime ~/ 60).toString().padLeft(2, '0');
    final sec = (resentOTPTime % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }
}

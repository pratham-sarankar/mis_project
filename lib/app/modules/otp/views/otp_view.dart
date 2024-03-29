import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mis_project/app/data/utils/enums/otp_status.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset("assets/vectors/auth/auth_bg_1.svg"),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset("assets/vectors/auth/auth_bg_2.svg"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset("assets/vectors/auth/auth_bg_3.svg"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset("assets/vectors/auth/auth_bg_4.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
              bottom: 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  SvgPicture.asset(
                    "assets/vectors/auth/auth_2.svg",
                    width: Get.width,
                  ),
                  Text(
                    "Verify OTP",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "Enter the OTP sent to your mobile number, ",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: controller.phoneNumber,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: " to verify your account.",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  PinCodeTextField(
                    appContext: Get.context!,
                    controller: controller.otpController,
                    length: 4,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    enablePinAutofill: true,
                    obscureText: false,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeColor: Get.theme.colorScheme.primary,
                      inactiveColor: Get.theme.colorScheme.primary,
                      selectedColor: Get.theme.colorScheme.primary,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: false,
                    backgroundColor: Colors.transparent,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      switch (controller.otpStatus.value) {
                        case OTPStatus.sent:
                          return Text(
                            "Resend OTP in ${controller.formattedOTPTime}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Get.theme.colorScheme.primary,
                            ),
                          );
                        case OTPStatus.resending:
                          return Text(
                            "Resending OTP...",
                            style: TextStyle(
                              fontSize: 14,
                              color: Get.theme.colorScheme.primary,
                            ),
                          );
                        case OTPStatus.canResend:
                          return InkWell(
                            onTap: () {
                              controller.resentOTP();
                            },
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                          );
                      }
                    }),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: controller.verifyOTP,
                    child: Obx(
                      () => controller.isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : const Text(
                              "Verify",
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

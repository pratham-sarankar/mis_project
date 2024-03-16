import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
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
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset(
                      "assets/vectors/auth/auth_1.svg",
                      width: Get.width,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Welcome back! Let's pick up right where you left off. There might even be some new things waiting for you.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      decoration: const InputDecoration(
                        hintText: "Mobile Number",
                        errorMaxLines: 2,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(13),
                      ],
                      onChanged: (value) {
                        if (!value.startsWith("+91")) {
                          var toAdd = "+91";
                          if (value.length == 1 && value.isNumericOnly) {
                            toAdd += value;
                          }
                          controller.phoneNumberController.text = toAdd;
                        }
                      },
                      validator: (value) {
                        if (!value.toString().isPhoneNumber) {
                          return "This field is required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: controller.onProceed,
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
                                "Proceed",
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

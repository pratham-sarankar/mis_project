import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/company_form_controller.dart';

class CompanyFormView extends GetView<CompanyFormController> {
  const CompanyFormView({Key? key}) : super(key: key);
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
              child: SafeArea(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Fill Company \nDetails.",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Transport Name",
                          hintText: "Enter Transport Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.company.transportName = value!;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        textAlignVertical: TextAlignVertical.center,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Office Address",
                          hintText: "Enter Office Address",
                        ),
                        onSaved: (value) {
                          controller.company.companyAddress = value!;
                        },
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(200),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "GSTIN Number",
                          hintText: "Enter GSTIN Number",
                        ),
                        onSaved: (value) {
                          controller.company.gstNumber = value!;
                        },
                        validator: (value) {
                          //Validate with regex /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/
                          if (value!.isEmpty) {
                            return "This field is required";
                          } else if (!RegExp(
                                  r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$')
                              .hasMatch(value)) {
                            return "Invalid GSTIN Number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: controller.onSubmit,
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
                                  "Submit",
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

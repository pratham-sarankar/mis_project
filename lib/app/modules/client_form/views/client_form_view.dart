import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/client_form_controller.dart';

class ClientFormView extends GetView<ClientFormController> {
  const ClientFormView({super.key});
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
                        "Fill Client \nDetails.",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: controller.client.name,
                        decoration: const InputDecoration(
                          labelText: "Client Name",
                          hintText: "Enter Client Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.client.name = value!;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        textAlignVertical: TextAlignVertical.center,
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
                              : Text(
                                  controller.isEdit ? "Update" : "Submit",
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (controller.isEdit)
                        Theme(
                          data: Get.theme.copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            title: const Text("More Actions"),
                            tilePadding: const EdgeInsets.all(0),
                            children: [
                              const ListTile(
                                leading: Icon(CupertinoIcons.delete),
                                title: Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Note: Deleting this client will delete all the associated consignments and ledgers.",
                                ),
                                // isThreeLine: true,
                              ),
                              OutlinedButton(
                                onPressed: controller.onDeleteAction,
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Get.theme.colorScheme.error,
                                  ),
                                  foregroundColor: Get.theme.colorScheme.error,
                                ),
                                child: Obx(
                                  () => controller.isDeleting.value
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white),
                                          ),
                                        )
                                      : const Text('Delete'),
                                ),
                              ),
                            ],
                          ),
                        ),
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

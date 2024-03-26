import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/routes/app_pages.dart';

import '../controllers/consignments_controller.dart';

class ConsignmentsView extends GetView<ConsignmentsController> {
  const ConsignmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Row(
          children: [
            Icon(CupertinoIcons.add),
            SizedBox(width: 5),
            Text("Add New"),
          ],
        ),
        onPressed: () {
          Get.toNamed(
            Routes.CONSIGNMENTS_FORM,
            arguments: {
              "client": controller.client,
              "consignment": Consignment.empty(),
            },
          );
        },
      ),
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
          Obx(
            () {
              return controller.isLoading.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: CupertinoActivityIndicator(
                            radius: 20,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Loading...",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    )
                  : Container();
            },
          ),
          Obx(() {
            if (controller.consignments.isEmpty) {
              return Center(
                child: SvgPicture.asset(
                  "assets/vectors/empty.svg",
                  width: Get.width * 0.65,
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text.rich(
                    TextSpan(
                      text: "${controller.client.name} >\n",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Get.theme.colorScheme.primary,
                      ),
                      children: [
                        TextSpan(
                          text: "Consignments.",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: controller.consignments.length,
                        itemBuilder: (context, index) {
                          final consignment = controller.consignments[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    consignment.vehicleNo,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Dispatch Date",
                                          ),
                                          Text(
                                            DateFormat("d MMM, yyyy").format(
                                              consignment.dispatchDate,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                            left: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              for (var i = 0; i <= 12; i++)
                                                Expanded(
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: i % 2 == 0
                                                        ? Colors.transparent
                                                        : Colors.black,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text("Delivery Date"),
                                          Text(
                                            DateFormat("d MMM, yyyy").format(
                                              consignment.deliveryDate!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.network(
                                          "https://cdn-icons-png.flaticon.com/128/854/854996.png",
                                          width: 40,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(":"),
                                        const SizedBox(width: 8),
                                        Text(
                                          consignment.destination,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.network(
                                          "https://cdn-icons-png.flaticon.com/128/15107/15107019.png",
                                          width: 40,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(":"),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Driver's Contact No.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              consignment.driverMobileNo,
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

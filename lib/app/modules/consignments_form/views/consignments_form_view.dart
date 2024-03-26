import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mis_project/app/widgets/date_form_field.dart';

import '../controllers/consignments_form_controller.dart';

class ConsignmentsFormView extends GetView<ConsignmentsFormController> {
  const ConsignmentsFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.submit,
        label: Obx(() {
          if (controller.isLoading.value) {
            return const CupertinoActivityIndicator(
              color: Colors.white,
            );
          } else {
            return const Row(
              children: [
                Icon(Icons.check),
                SizedBox(width: 5),
                Text("Submit"),
              ],
            );
          }
        }),
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
                          text: "Add New.",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter LR Number",
                                labelText: "LR Number",
                              ),
                              initialValue: controller.consignment.lrNo,
                              onSaved: (newValue) {
                                controller.consignment.lrNo = newValue!;
                              },
                            ),
                            const SizedBox(height: 25),
                            DateFormField(
                              hintText: "dd/mm/yyyy",
                              labelText: "Dispatch Date",
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              initialDate: controller.consignment.dispatchDate,
                              onSaved: (date) {
                                controller.consignment.dispatchDate = date;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Destination",
                                labelText: "Destination",
                              ),
                              initialValue: controller.consignment.destination,
                              onSaved: (newValue) {
                                controller.consignment.destination = newValue!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Vehicle No.",
                                labelText: "Vehicle No.",
                              ),
                              initialValue: controller.consignment.vehicleNo,
                              onSaved: (newValue) {
                                controller.consignment.vehicleNo = newValue!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Driver's Mobile No.",
                                labelText: "Driver's Mobile No.",
                              ),
                              initialValue:
                                  controller.consignment.driverMobileNo,
                              onSaved: (newValue) {
                                controller.consignment.driverMobileNo =
                                    newValue!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Delivery Status",
                                labelText: "Delivery Status",
                              ),
                              initialValue:
                                  controller.consignment.deliveryStatus,
                              onSaved: (newValue) {
                                controller.consignment.deliveryStatus =
                                    newValue!;
                              },
                            ),
                            const SizedBox(height: 25),
                            DateFormField(
                              hintText: "dd/mm/yyyy",
                              labelText: "Delivery Date",
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              initialDate: controller.consignment.deliveryDate,
                              onSaved: (date) {
                                controller.consignment.deliveryDate = date;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Total Freight",
                                labelText: "Total Freight",
                              ),
                              initialValue: controller
                                  .consignment.ledger.totalFreight
                                  .toString(),
                              validator: (value) {
                                if (!value.toString().isNum) {
                                  return "Invalid Amount";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                controller.consignment.ledger.totalFreight =
                                    num.parse(newValue!);
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Advance",
                                labelText: "Advance",
                              ),
                              initialValue: controller
                                  .consignment.ledger.advance
                                  .toString(),
                              validator: (value) {
                                if (!value.toString().isNum) {
                                  return "Invalid Amount";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                controller.consignment.ledger.advance =
                                    num.parse(newValue!);
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter Freight Offered",
                                labelText: "Freight Offered",
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: false,
                                decimal: true,
                              ),
                              initialValue: controller.consignment.ledger
                                  .profitAndLoss.freightOffered
                                  .toString(),
                              validator: (value) {
                                if (!value.toString().isNum) {
                                  return "Invalid Amount";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                controller.consignment.ledger.profitAndLoss
                                    .freightOffered = num.parse(newValue!);
                              },
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

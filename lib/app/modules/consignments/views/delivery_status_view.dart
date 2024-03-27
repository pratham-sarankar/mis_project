import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/modules/consignments/controllers/delivery_status_controller.dart';

class DeliveryStatusView extends GetView<DeliveryStatusController> {
  const DeliveryStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delivery Status"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Update the delivery status here. The status will be updated accordingly.",
          ),
          const SizedBox(height: 15),
          TextField(
            controller: controller.deliveryStatusController,
            decoration: const InputDecoration(
              labelText: "Status Controller",
              hintText: "Enter Status Controller",
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            autofocus: true,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: controller.submit,
            child: Obx(() {
              if (controller.isLoading.value) {
                return const CupertinoActivityIndicator(
                  color: Colors.white,
                );
              } else {
                return const Text("Submit");
              }
            }),
          )
        ],
      ),
    );
  }
}

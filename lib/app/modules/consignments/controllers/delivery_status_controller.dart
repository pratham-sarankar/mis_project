import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/data/repositories/consignment_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class DeliveryStatusController extends GetxController {
  late TextEditingController deliveryStatusController;
  late Consignment consignment;
  late RxBool isLoading;

  @override
  void onInit() {
    consignment = Get.arguments!;
    deliveryStatusController =
        TextEditingController(text: consignment.deliveryStatus);
    isLoading = false.obs;
    super.onInit();
  }

  void submit() async {
    try {
      isLoading.value = true;
      final result = await Get.find<ConsignmentRepository>()
          .updateDeliveryStatus(consignment, deliveryStatusController.text);
      isLoading.value = false;
      Get.back(result: result);
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
}

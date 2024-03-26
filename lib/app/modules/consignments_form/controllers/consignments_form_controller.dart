import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/client.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/data/repositories/consignment_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class ConsignmentsFormController extends GetxController {
  late Client client;
  late Consignment consignment;
  late final GlobalKey<FormState> formKey;
  late RxBool isLoading;

  @override
  void onInit() {
    client = Get.arguments['client'];
    consignment = Get.arguments['consignment'];
    formKey = GlobalKey<FormState>();
    isLoading = false.obs;
    super.onInit();
  }

  void submit() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        isLoading.value = true;
        final result =
            await Get.find<ConsignmentRepository>().create(consignment, client);
        isLoading.value = false;
        Get.back(result: result);
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
}

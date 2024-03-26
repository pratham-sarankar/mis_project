import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/client.dart';
import 'package:mis_project/app/data/repositories/client_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class ClientFormController extends GetxController {
  late GlobalKey<FormState> formKey;
  late String name;
  late RxBool isLoading;
  late bool isEdit;
  late Client client;
  late RxBool isDeleting;

  @override
  void onInit() {
    isLoading = false.obs;
    formKey = GlobalKey<FormState>();
    client = Get.arguments ?? Client.empty();
    isEdit = Get.arguments != null;
    name = client.name;
    isDeleting = false.obs;
    super.onInit();
  }

  void onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        isLoading.value = true;
        if (!isEdit) {
          client = await Get.find<ClientRepository>().createClient(client);
        } else {
          client = await Get.find<ClientRepository>().updateClient(client);
        }
        isLoading.value = false;
        Get.back(result: client);
      }
    } catch (e) {
      Toast.showError(e.toString());
    }
  }

  void onDeleteAction() async {
    try {
      isDeleting.value = true;
      await Get.find<ClientRepository>().deleteClient(client);
      isDeleting.value = false;
      Get.back(result: client);
    } catch (e) {
      isDeleting.value = false;
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

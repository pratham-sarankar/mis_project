import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/company.dart';
import 'package:mis_project/app/data/repositories/company_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';
import 'package:mis_project/app/routes/app_pages.dart';

class CompanyFormController extends GetxController {
  late Company company;
  late RxBool isLoading;
  late RxBool isCreating;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    company = Get.arguments ?? Company.empty();
    isCreating = (Get.arguments == null).obs;
    isLoading = false.obs;
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSubmit() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        isLoading.value = true;
        company = await Get.find<CompanyRepository>().create(company);
        isLoading.value = false;
        if (isCreating.value) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.back(result: company);
        }
      }
    } catch (e) {
      isLoading.value = false;
      Toast.showError(e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/data/repositories/consignment_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';
import 'package:mis_project/app/modules/consignments/utils/ExpenseAction.dart';

class ExpensesController extends GetxController {
  late Consignment consignment;
  late TextEditingController amountController;
  late Rx<ExpenseAction> action;
  late RxBool isLoading;

  @override
  void onInit() {
    consignment = Get.arguments!;
    amountController = TextEditingController();
    action = ExpenseAction.add.obs;
    isLoading = false.obs;
    super.onInit();
  }

  void changeAction(ExpenseAction? newAction) {
    action.value = newAction!;
  }

  void submit() async {
    try {
      isLoading.value = true;
      final amount = double.parse(amountController.text);
      final result = await Get.find<ConsignmentRepository>()
          .updateExpenses(consignment, action.value, amount);
      Get.back(result: result);
      isLoading.value = false;
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
    amountController.dispose();
    super.onClose();
  }
}

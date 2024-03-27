import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/modules/consignments/controllers/expenses_controller.dart';
import 'package:mis_project/app/modules/consignments/utils/ExpenseAction.dart';

class ExpensesView extends GetView<ExpensesController> {
  const ExpensesView({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Expenses"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add or Subtract your expenses here. The profit will be updated accordingly.",
          ),
          const SizedBox(height: 10),
          Obx(() {
            return Row(
              children: [
                RadioMenuButton(
                  value: ExpenseAction.add,
                  groupValue: controller.action.value,
                  onChanged: controller.changeAction,
                  child: const Text("Add"),
                ),
                RadioMenuButton(
                  value: ExpenseAction.subtract,
                  groupValue: controller.action.value,
                  onChanged: controller.changeAction,
                  child: const Text("Subtract"),
                ),
              ],
            );
          }),
          const SizedBox(height: 10),
          TextField(
            controller: controller.amountController,
            decoration: const InputDecoration(
              labelText: "Amount",
              hintText: "Enter the amount",
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            autofocus: true,
          ),
          const SizedBox(height: 10),
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

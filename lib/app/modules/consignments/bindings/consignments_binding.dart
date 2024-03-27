import 'package:get/get.dart';
import 'package:mis_project/app/modules/consignments/controllers/delivery_status_controller.dart';
import 'package:mis_project/app/modules/consignments/controllers/expenses_controller.dart';

import '../controllers/consignments_controller.dart';

class ConsignmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryStatusController>(
      () => DeliveryStatusController(),
      fenix: true,
    );
    Get.lazyPut<ExpensesController>(
      () => ExpensesController(),
      fenix: true,
    );
    Get.lazyPut<ConsignmentsController>(
      () => ConsignmentsController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/consignments_controller.dart';

class ConsignmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsignmentsController>(
      () => ConsignmentsController(),
    );
  }
}

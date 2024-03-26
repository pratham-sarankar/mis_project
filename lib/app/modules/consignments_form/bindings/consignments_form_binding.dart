import 'package:get/get.dart';

import '../controllers/consignments_form_controller.dart';

class ConsignmentsFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsignmentsFormController>(
      () => ConsignmentsFormController(),
    );
  }
}

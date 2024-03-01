import 'package:get/get.dart';

import '../controllers/company_form_controller.dart';

class CompanyFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyFormController>(
      () => CompanyFormController(),
    );
  }
}

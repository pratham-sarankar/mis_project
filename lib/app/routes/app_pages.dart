import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/client_form/bindings/client_form_binding.dart';
import '../modules/client_form/views/client_form_view.dart';
import '../modules/company_form/bindings/company_form_binding.dart';
import '../modules/company_form/views/company_form_view.dart';
import '../modules/consignments/bindings/consignments_binding.dart';
import '../modules/consignments/views/consignments_view.dart';
import '../modules/consignments_form/bindings/consignments_form_binding.dart';
import '../modules/consignments_form/views/consignments_form_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<AuthService>().isLoggedIn ? Routes.HOME : Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_FORM,
      page: () => const CompanyFormView(),
      binding: CompanyFormBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_FORM,
      page: () => const ClientFormView(),
      binding: ClientFormBinding(),
    ),
    GetPage(
      name: _Paths.CONSIGNMENTS,
      page: () => const ConsignmentsView(),
      binding: ConsignmentsBinding(),
    ),
    GetPage(
      name: _Paths.CONSIGNMENTS_FORM,
      page: () => const ConsignmentsFormView(),
      binding: ConsignmentsFormBinding(),
    ),
  ];
}

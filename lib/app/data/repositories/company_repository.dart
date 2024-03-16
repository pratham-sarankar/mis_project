import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/company.dart';

import '../services/auth_service.dart';

class CompanyRepository extends GetConnect {
  @override
  void onInit() {
    baseUrl = dotenv.env['HOST'];
    super.onInit();
  }

  Future<Company> create(Company company) async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response =
        await post("/company/", company.toJson(), headers: headers);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      return Company.fromJson(response.body['company']);
    }
  }
}

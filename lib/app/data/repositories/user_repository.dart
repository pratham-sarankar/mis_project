import 'package:get/get.dart';
import 'package:mis_project/app/data/models/user.dart';
import 'package:mis_project/app/data/services/auth_service.dart';

class UserRepository extends GetConnect {
  Future<User> fetchMe() async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response = await get("/user/me", headers: headers);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      return User.fromJson(response.body);
    }
  }
}

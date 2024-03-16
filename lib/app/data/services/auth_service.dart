import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  late GetStorage box;

  @override
  void onInit() {
    box = GetStorage();
    super.onInit();
  }

  bool get isLoggedIn => box.hasData("accessToken");

  //Save accessToken to local storage
  Future saveToken(String token) async {
    print("Saving token : $token");
    await box.write("accessToken", token);
  }

  Future<String> getToken() async {
    print("Fetching Token : ${box.read("accessToken")} ");
    return await box.read("accessToken");
  }
}

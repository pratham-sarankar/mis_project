import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/responses/login_response.dart';
import 'package:mis_project/app/data/services/auth_service.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class AuthRepository extends GetConnect {
  @override
  void onInit() {
    baseUrl = dotenv.env['HOST'];
    super.onInit();
  }

  Future<String> login(String phoneNumber) async {
    Response response =
        await post("/user/login", json.encode({"phoneNumber": phoneNumber}));
    print(response.body);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      //TODO: Remove the following code. This is for temporarily showing the OTP until the SMS Api is integrated.
      Toast.showError(response.body['otp']);
      return response.body['verificationToken'];
    }
  }

  Future<String> resendOTP(String verificationToken) async {
    Response response = await post("/user/resend-otp",
        json.encode({"verificationToken": verificationToken}));
    print(response.body);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      //TODO: Remove the following code. This is for temporarily showing the OTP until the SMS Api is integrated.
      Toast.showError(response.body['otp']);
      return response.body['verificationToken'];
    }
  }

  Future<LoginResponse> verifyOTP(String verificationToken, String otp) async {
    Response response = await post("/user/verify-otp",
        json.encode({"verificationToken": verificationToken, "otp": otp}));
    print(response.body);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      final result = LoginResponse.fromJson(response.body);
      await Get.find<AuthService>().saveToken(result.accessToken);
      return result;
    }
  }
}

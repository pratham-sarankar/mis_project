class LoginResponse {
  final String message;
  final String accessToken;
  final bool isNewUser;

  LoginResponse(
      {required this.message,
      required this.accessToken,
      required this.isNewUser});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      accessToken: json['accessToken'],
      isNewUser: json['isNewUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'accessToken': accessToken,
      'isNewUser': isNewUser,
    };
  }
}

import 'package:mis_project/app/data/models/company.dart';

class User {
  final String phoneNumber;
  final Company company;

  User({
    required this.phoneNumber,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phoneNumber'],
      company: Company.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'company': company.toJson(),
    };
  }
}

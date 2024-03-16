import 'package:mis_project/app/data/models/client.dart';

class Company {
  final String id;
  String transportName;
  String companyAddress;
  String gstNumber;
  final List<Client> clients;

  Company({
    required this.id,
    required this.transportName,
    required this.companyAddress,
    required this.gstNumber,
    required this.clients,
  });

  factory Company.empty() {
    return Company(
      id: '',
      transportName: '',
      companyAddress: '',
      gstNumber: '',
      clients: [],
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      transportName: json['transportName'],
      companyAddress: json['companyAddress'],
      gstNumber: json['gstNumber'],
      clients: List.from(json['clients'])
          .map((client) => Client.fromJson(client))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transportName': transportName,
      'companyAddress': companyAddress,
      'gstNumber': gstNumber,
      'clients': clients.map((client) => client.toJson()).toList(),
    };
  }
}

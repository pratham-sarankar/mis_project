import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/client.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/data/services/auth_service.dart';

class ConsignmentRepository extends GetConnect {
  Future<List<Consignment>> fetchConsignments(Client client) async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response =
        await get("/consignment/client/${client.id}", headers: headers);
    if (response.hasError) {
      throw response.body['message'];
    } else {
      return List.from(response.body['consignments'])
          .map((e) => Consignment.fromJson(e))
          .toList();
    }
  }

  Future<Consignment> create(Consignment consignment, Client client) async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response = await post(
      "/consignment/${client.id}",
      consignment.toJson(isInline: true),
      headers: headers,
    );
    if (response.hasError) {
      throw response.body['message'];
    } else {
      return Consignment.fromJson(response.body['consignment']);
    }
  }

  @override
  void onInit() {
    baseUrl = dotenv.env['HOST'];
    super.onInit();
  }
}

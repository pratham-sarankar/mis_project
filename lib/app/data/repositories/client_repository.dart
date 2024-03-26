import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mis_project/app/data/models/client.dart';
import 'package:mis_project/app/data/services/auth_service.dart';

class ClientRepository extends GetConnect {
  Future<List<Client>> fetchClients() async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response = await get("/client/me", headers: headers);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      return (response.body['clients'] as List)
          .map((e) => Client.fromJson(e))
          .toList();
    }
  }

  Future<Client> createClient(Client client) async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response = await post("/client", client.toJson(), headers: headers);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      return Client.fromJson(response.body['client']);
    }
  }

  Future<Client> updateClient(Client client) async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response =
        await put("/client/${client.id}", client.toJson(), headers: headers);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      return Client.fromJson(response.body['client']);
    }
  }

  Future<void> deleteClient(Client client) async {
    final token = await Get.find<AuthService>().getToken();
    final headers = {"Authorization": "Bearer $token"};
    final response = await delete("/client/${client.id}", headers: headers);
    if (response.status.hasError) {
      throw response.body['message'];
    } else {
      return;
    }
  }

  @override
  void onInit() {
    baseUrl = dotenv.env['HOST'];
    super.onInit();
  }
}

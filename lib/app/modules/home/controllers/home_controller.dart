import 'package:get/get.dart';
import 'package:mis_project/app/data/models/client.dart';
import 'package:mis_project/app/data/repositories/client_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class HomeController extends GetxController {
  late RxBool isLoading;
  late RxList<Client> clients;

  @override
  void onInit() {
    isLoading = false.obs;
    clients = <Client>[].obs;
    loadClients();
    super.onInit();
  }

  void loadClients() async {
    try {
      isLoading.value = true;
      final response = await Get.find<ClientRepository>().fetchClients();
      clients.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Toast.showError(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

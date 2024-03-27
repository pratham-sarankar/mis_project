import 'package:get/get.dart';
import 'package:mis_project/app/data/models/client.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/data/repositories/consignment_repository.dart';
import 'package:mis_project/app/data/utils/toast.dart';

class ConsignmentsController extends GetxController {
  late Client client;
  late RxList<Consignment> consignments;
  late RxBool isLoading;

  @override
  void onInit() {
    client = Get.arguments!;
    consignments = <Consignment>[].obs;
    isLoading = false.obs;
    loadConsignments();
    super.onInit();
  }

  void loadConsignments() async {
    try {
      isLoading.value = true;
      final result =
          await Get.find<ConsignmentRepository>().fetchConsignments(client);
      consignments.value = result;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Toast.showError(e.toString());
      rethrow;
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

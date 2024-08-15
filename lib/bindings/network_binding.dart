import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_project/controller/connectivity_controller.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityController>(
        ConnectivityController(connectivityService: Connectivity()),
        permanent: true);
  }
}

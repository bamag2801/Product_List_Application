import 'package:dio/dio.dart';
import 'package:firebase_project/controller/product_controller.dart';
import 'package:firebase_project/data/service/product_service.dart';
import 'package:get/get.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductController(
        productClient: ProductClient(
          client: Dio(),
        ),
      ),
    );
  }
}

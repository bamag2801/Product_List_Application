import 'package:firebase_project/data/model/product_list_model.dart';
import 'package:firebase_project/data/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductClient? productClient;

  ProductController({this.productClient});

  //get product list
  final _productListLoading = false.obs;

  bool get productListLoading => _productListLoading.value;

  set productListLoading(bool value) => _productListLoading.value = value;

  final _productListModel = ProductListModel().obs;

  ProductListModel get productListModel => _productListModel.value;

  set productListModel(ProductListModel value) =>
      _productListModel.value = value;

  Future<void> getProductListData() async {
    try {
      productListLoading = true;
      productListModel = await productClient!.fetchProductListData();
      productListLoading = false;
    } catch (err) {
      productListLoading = false;
    }
  }
}

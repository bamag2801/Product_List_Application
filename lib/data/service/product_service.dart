import 'package:dio/dio.dart';
import 'package:firebase_project/data/model/product_list_model.dart';
import 'package:firebase_project/ui/constants/api_urls.dart';

class ProductClient {
  Dio? client;

  ProductClient({this.client});

  int? _responseCode;

  int get responseCode => _responseCode!;

  set responseCode(int value) => _responseCode = value;

  //get product list
  Future fetchProductListData() async {
    try {
      client!.interceptors.add(LogInterceptor(responseBody: true));
      Response response = await client!.get(ApiUrls.getAllProductUrl);
      return ProductListModel.fromJson(response.data);
    } on DioException {
      return Exception("Something went wrong");
    }
  }
}

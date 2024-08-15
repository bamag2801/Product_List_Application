import 'package:firebase_project/controller/product_controller.dart';
import 'package:firebase_project/data/model/product_list_model.dart';
import 'package:firebase_project/routes/app_pages.dart';
import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/widgets/custom_appbar_widget.dart';
import 'package:firebase_project/ui/widgets/custom_snackbar.dart';
import 'package:firebase_project/ui/widgets/cutom_loader_component.dart';
import 'package:firebase_project/ui/widgets/product_list_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productController = Get.find<ProductController>();
  List<ProductListData> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      await productController.getProductListData();
      productList = productController.productListModel.productListData!;
    } catch (error) {
      CustomSnackBar.showSnackBarMessage(
          isError: true, message: "Something went wrong", snackPosition: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBarWidget(
        title: "Products",
        isDashboard: true,
      ),
      body: Obx(() {
        return productController.productListLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.pinkAccent,
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductListComponent(
                    productImage: productList[index].thumbnail,
                    buttonFunction: () {},
                    productName: productList[index].title,
                    category: productList[index].category,
                    brand: productList[index].brand,
                    stock: productList[index].stock.toString(),
                  );
                });
      }),
    );
  }
}

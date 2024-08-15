import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/bindings/product_bindings.dart';
import 'package:firebase_project/controller/connectivity_controller.dart';
import 'package:firebase_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  Get.put(
    ConnectivityController(
      connectivityService: Connectivity(),
    ),
  );
  runApp(const CustomMaterialApp());
}

class CustomMaterialApp extends StatefulWidget {
  const CustomMaterialApp({super.key});

  @override
  State<CustomMaterialApp> createState() => _CustomMaterialAppState();
}

class _CustomMaterialAppState extends State<CustomMaterialApp> {
  final connectivityController = Get.find<ConnectivityController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();
  }

  void checkInternetConnection() {
    connectivityController.checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, _) {
        return GetMaterialApp(
          initialBinding: ProductBindings(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initial,
          defaultTransition: Transition.fade,
          getPages: AppPages.pages,
        );
      },
    );
  }
}

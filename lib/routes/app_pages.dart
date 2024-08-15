import 'package:firebase_project/bindings/network_binding.dart';
import 'package:firebase_project/bindings/product_bindings.dart';
import 'package:firebase_project/ui/screens/product_screen.dart';
import 'package:firebase_project/ui/screens/sign_in_screen.dart';
import 'package:firebase_project/ui/screens/sign_up_screen.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static bool showCupertinoAnimation = false;
  static final pages = [
    GetPage(
        name: Routes.initial,
        page: () => const SignInScreen(),
        showCupertinoParallax: showCupertinoAnimation,
        bindings: [
          NetworkBinding(),
          ProductBindings(),
        ]),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
      showCupertinoParallax: showCupertinoAnimation,
    ),
    GetPage(
      name: Routes.productScreen,
      page: () => const ProductScreen(),
      showCupertinoParallax: showCupertinoAnimation,
    ),
  ];
}

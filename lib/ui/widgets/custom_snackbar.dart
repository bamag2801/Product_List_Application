import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSnackBarMessage({
    String? title,
    String? message,
    bool snackPosition = false,
    bool isIconAvailable = false,
    bool isError = false,
  }) {
    isError
        ? Get.rawSnackbar(
      duration: const Duration(seconds: 3),
      title: title,
      message: message,
      messageText: Center(
        child: Text(message!,
            style: TextStyle(
                color:  Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700)),
      ),
      margin: EdgeInsets.all(15.r),
      padding: EdgeInsets.all(10.r),
      backgroundColor:  const Color.fromRGBO(255, 0, 0, 1),
      borderRadius: 20.0,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
      snackPosition:
      snackPosition ? SnackPosition.TOP : SnackPosition.BOTTOM,
    )
        : Get.rawSnackbar(
      duration: const Duration(seconds: 3),
      title: title,
      message: message,
      messageText: Center(
        child: Text(message!,
            style: TextStyle(
                color:  Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700)),
      ),
      margin: EdgeInsets.all(15.r),
      padding: EdgeInsets.all(10.r),

      backgroundColor:  Colors.green,
      borderRadius: 20.0,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
      snackPosition:
      snackPosition ? SnackPosition.TOP : SnackPosition.BOTTOM,
    );
  }
}

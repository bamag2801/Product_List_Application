import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final bool? inButton;
  final double? loaderSize;
  final Color? loaderColor;
  final bool? isSplashLoading;

  const CustomLoader(
      {super.key,
      this.inButton = false,
      @required this.loaderSize,
      this.loaderColor,
      this.isSplashLoading = false});

  @override
  Widget build(BuildContext context) {
    return isSplashLoading!
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.pink,
          ))
        : SizedBox(
            height: inButton! ? 20.0 : null,
            width: inButton! ? 40.0 : null,
            child: SpinKitCircle(
                color: loaderColor ??
                    Theme.of(context).appBarTheme.backgroundColor,
                size: loaderSize!.sp));
  }
}

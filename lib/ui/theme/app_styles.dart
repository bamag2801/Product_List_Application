import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextStyle appBarTitleStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final TextStyle labelText = TextStyle(
    fontSize: 12.sp, fontWeight: FontWeight.w300, color: Colors.white);

final TextStyle inputBoxTextStyle =
    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400);

final TextStyle errorTextStyle_12 = TextStyle(
    fontSize: 12.sp, fontWeight: FontWeight.w500, color: primaryColor);

final TextStyle cardSmallText = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 12.sp,
  color: Colors.white,
);

final ButtonStyle elevatedButtonStyle_1 = ElevatedButton.styleFrom(
  elevation: 0.0,
  backgroundColor: primaryColor,
  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 6.sp),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

final TextStyle buttonTextStyle_1 = TextStyle(
    fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black);

final TextStyle cardNameText = TextStyle(
    fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white);

final TextStyle detailCardSmallText = TextStyle(
    fontSize: 12.sp, fontWeight: FontWeight.w500, color: cardTextColor);

final TextStyle cardLabelText = TextStyle(
    fontWeight: FontWeight.w700, fontSize: 12.sp, color: Colors.black);

import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDashboard;
  final bool isHistoryAvailable;
  final double barHeight = 40.0;
  final IconData? buttonIcon;
  final bool? isBackFunction;
  final Function? backFunction;
  final Function? iconButtonFunction;

  const CustomAppBarWidget(
      {super.key,
        this.title = "",
        this.isDashboard = false,
        this.buttonIcon,
        this.isHistoryAvailable = false,
        this.isBackFunction = false,
        this.iconButtonFunction,
        this.backFunction});


  @override
  Size get preferredSize => Size.fromHeight(barHeight + 50.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(barHeight + 40),
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
            color: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppBar(
                  backgroundColor: primaryColor,
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  leading: isDashboard == true
                      ? const SizedBox()
                      : Padding(
                    padding: EdgeInsets.only(bottom: 25.0.r, left: 5.0.r),
                    child: GestureDetector(
                      onTap: () => isBackFunction! ? backFunction!() : Get.back(),
                      child:  Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.transparent
                          ),
                          child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black,size: 20.r,)),
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 25.0.r),
                    child: Text(title, style: appBarTitleStyle),
                  ),
                  centerTitle: true,
                  actions: [
                    isHistoryAvailable
                     ? SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0.r, right: 15.0.r),
                        child: GestureDetector(
                          onTap: iconButtonFunction!(),
                          child:  Icon(buttonIcon!, color: Colors.black,size: 25.r,),
                        ),
                      ),
                    )
                        : const SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

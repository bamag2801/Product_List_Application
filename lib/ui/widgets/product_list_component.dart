import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListComponent extends StatelessWidget {
  final String? productName;
  final String? category;
  final String? brand;
  final String? productImage;
  final Function? buttonFunction;
  final String? stock;

  const ProductListComponent(
      {Key? key,
      this.productName,
      this.category,
      this.brand,
      this.productImage,
      this.buttonFunction,
      this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 2.r),
      child: GestureDetector(
        onTap: () => buttonFunction!(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 330.w,
                  padding: EdgeInsets.all(10.0.r),
                  constraints: BoxConstraints(maxWidth: 360.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: cardColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(productImage!),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        productName!,
                                        softWrap: true,
                                        maxLines: 2,
                                        style: cardNameText,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      "Category : ",
                                      style: detailCardSmallText,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      category!,
                                      style: detailCardSmallText,
                                    ),
                                  ],
                                ),
                                brand != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            "Brand : ",
                                            style: detailCardSmallText,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            brand!,
                                            style: detailCardSmallText,
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Container(
                      height: 25.h,
                      width: 120.w,
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 4.0, top: 5.0),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stock : ",
                            style: cardLabelText,
                          ),
                          Text(
                            stock!,
                            style: cardLabelText,
                          ),
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

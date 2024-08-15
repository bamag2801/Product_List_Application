import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/widgets/cutom_loader_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool? isBackButton;
  final Key? key;
  final buttonFunction;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final bool isIconAvailable;
  final IconData? iconData;
  final ButtonStyle? elevatedButtonStyle;
  final bool isLoading;
  final bool isDisabledText;
  final bool disabledButton;

  CustomButton(
      {this.key,
      this.isBackButton,
      @required this.buttonFunction,
      @required this.buttonText,
      @required this.buttonTextStyle,
      @required this.elevatedButtonStyle,
      this.isIconAvailable = false,
      this.iconData,
      this.isLoading = false,
      this.isDisabledText = false,
      this.disabledButton = false});

  @override
  Widget build(BuildContext context) {
    return isIconAvailable
        ? disabledButton
            ? ElevatedButton.icon(
                style: elevatedButtonStyle!.copyWith(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    backgroundColor: WidgetStateProperty.all(Colors.grey),
                    splashFactory: null),
                onPressed: null,
                icon: Icon(iconData, size: 15.r),
                label: Container(
                    constraints:
                        const BoxConstraints(minHeight: 20.0, minWidth: 50.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(buttonText!,
                          style: buttonTextStyle, textAlign: TextAlign.center)
                    ])))
            : ElevatedButton.icon(
                style: elevatedButtonStyle!.copyWith(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    backgroundColor: isLoading ? WidgetStateProperty.all(Colors.grey) : WidgetStateProperty.all(isBackButton! ? secondaryColor : Colors.red),
                    splashFactory: isLoading ? NoSplash.splashFactory : null),
                onPressed: isLoading ? () {} : buttonFunction,
                icon: Icon(
                  iconData,
                  size: 20.r,
                  color: Colors.black,
                ),
                label: Container(
                    constraints: const BoxConstraints(minHeight: 20.0, minWidth: 50.0),
                    child: isLoading
                        ? isDisabledText
                            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(buttonText!, style: buttonTextStyle, textAlign: TextAlign.center)])
                            : const CustomLoader(inButton: true, loaderSize: 20.0, loaderColor: Colors.white)
                        : Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(buttonText!, style: buttonTextStyle, textAlign: TextAlign.center)])))
        : disabledButton
            ? ElevatedButton(
                style: elevatedButtonStyle!.copyWith(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                    backgroundColor: WidgetStateProperty.all(Colors.grey),
                    splashFactory: null),
                onPressed: null,
                child: Container(constraints: const BoxConstraints(minHeight: 20.0, minWidth: 50.0), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(buttonText!, style: buttonTextStyle, textAlign: TextAlign.center)])))
            : ElevatedButton(
                style: elevatedButtonStyle!.copyWith(
                    // shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(15.0),
                    // )),
                    backgroundColor: isLoading ? WidgetStateProperty.all(Colors.grey) : null,
                    splashFactory: isLoading ? NoSplash.splashFactory : null),
                onPressed: isLoading ? () {} : buttonFunction,
                child: Container(
                    constraints: const BoxConstraints(minHeight: 20.0, minWidth: 50.0),
                    child: isLoading
                        ? isDisabledText
                            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(buttonText!, style: buttonTextStyle, textAlign: TextAlign.center)])
                            : const CustomLoader(inButton: true, loaderSize: 20.0, loaderColor: Colors.white)
                        : Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(buttonText!, style: buttonTextStyle, textAlign: TextAlign.center)])));
  }
}

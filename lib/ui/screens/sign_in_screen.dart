import 'package:firebase_project/routes/app_pages.dart';
import 'package:firebase_project/ui/constants/functions.dart';
import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/theme/app_styles.dart';
import 'package:firebase_project/ui/widgets/RegExpressions.dart';
import 'package:firebase_project/ui/widgets/custom_appbar_widget.dart';
import 'package:firebase_project/ui/widgets/custom_button_component.dart';
import 'package:firebase_project/ui/widgets/input_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBarWidget(
        title: "Welcome",
        isDashboard: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputBoxWidget(
                width: 280.w,
                labelText: "Email",
                inputBoxController: _emailController,
                emptyValidation: true,
                emptyValidationText: "Email",
                hintText: "Enter your email",
                isSuffixNeeded: false,
                requiredValidationText: "Email",
                autoValidation: true,
                validationLogic: (value) {
                  if (value.isNotEmpty) {
                    if (!value.isNum) {
                      return CommonFunctions.emailValidation(value);
                    }
                  } else {
                    return "Email is required";
                  }
                },
              ),
              InputBoxWidget(
                width: 280.w,
                isPassword: true,
                hintText: "Password",
                labelText: "Password",
                inputBoxController: _passwordController,
                emptyValidation: true,
                emptyValidationText: "Password",
                autoValidation: true,
                requiredValidationText: "Password",
                validationLogic: (value) => validatePassword(value),
              ),
              const SizedBox(
                height: 35.0,
              ),
              SizedBox(
                width: 230.w,
                child: CustomButton(
                    isBackButton: false,
                    buttonFunction: () {
                      if (_formKey.currentState!.validate()) {
                        Get.offNamed(Routes.productScreen);
                      }
                    },
                    buttonText: "Login",
                    isIconAvailable: false,
                    elevatedButtonStyle: elevatedButtonStyle_1,
                    buttonTextStyle: buttonTextStyle_1),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account?",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.signUpScreen);
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  dynamic validatePassword(String value) {
    if (!RegExpression.validateAtLeastEightCharacter(value)) {
      return "Password must contain 8 letters";
    } else if (!RegExpression.validateAtLeastOneDigit(value)) {
      return "Password must contain a number";
    } else if (!RegExpression.validateUpperCase(value)) {
      return "Password must contain a uppercase";
    } else if (!RegExpression.validateLowercase(value)) {
      return "Password must contain a lowercase";
    } else if (!RegExpression.validateSpecialCharacter(value)) {
      return "Password must contain a special character";
    } else {
      _passwordController.text = value;
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/routes/app_pages.dart';
import 'package:firebase_project/ui/constants/functions.dart';
import 'package:firebase_project/ui/screens/sign_in_screen.dart';
import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/theme/app_styles.dart';
import 'package:firebase_project/ui/widgets/RegExpressions.dart';
import 'package:firebase_project/ui/widgets/custom_appbar_widget.dart';
import 'package:firebase_project/ui/widgets/custom_button_component.dart';
import 'package:firebase_project/ui/widgets/input_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBarWidget(
        title: "SignUp",
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
                labelText: "User Name",
                inputBoxController: _nameController,
                emptyValidation: true,
                emptyValidationText: "User Name",
                hintText: "Enter your username",
                isSuffixNeeded: false,
                requiredValidationText: "User Name",
                autoValidation: true,
                validationLogic: (value) {
                  if (value.isNotEmpty) {
                    if (!value.isNum) {
                      return CommonFunctions.nameValidation(value);
                    }
                  } else {
                    return "Name is required";
                  }
                },
              ),
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
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) {
                        Get.offNamed(Routes.initial);
                      });
                    },
                    buttonText: "Sign Up",
                    isIconAvailable: false,
                    elevatedButtonStyle: elevatedButtonStyle_1,
                    buttonTextStyle: buttonTextStyle_1),
              ),
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

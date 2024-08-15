import 'package:firebase_project/ui/theme/app_colors.dart';
import 'package:firebase_project/ui/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//callback for validation
typedef dynamic InputBoxCallback(String value);
typedef dynamic SaveFunctionCallback(String saveValue);
typedef dynamic OnChangedCallback(String value);

class InputBoxWidget extends StatefulWidget {
  final Key? key;
  final double? height;
  final double? width;
  final String? suffixText;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final SaveFunctionCallback? onSaveFunction;
  final InputBoxCallback? validationLogic;
  final OnChangedCallback? onChangedCallback;
  final TextEditingController? inputBoxController;
  final bool isPassword;
  final bool numberKeyboard;
  final bool emptyValidation;
  final String? emptyValidationText;
  final String? requiredValidationText;
  final bool? autoValidation;
  final bool? isSuffixNeeded;
  final bool? isRequiredField;
  final bool? isEnabled;
  final String? regExp;
  final bool? isCharacters;

  final bool? isAssessmentBox;
  final bool? isCustomBox;

  const InputBoxWidget(
      {this.key,
      this.height,
      this.width,
      this.suffixText = "",
      this.labelText = "",
      this.hintText = "",
      this.maxLines,
      this.minLines,
      this.validationLogic,
      this.onChangedCallback,
      this.onSaveFunction,
      this.inputBoxController,
      this.isPassword = false,
      this.numberKeyboard = false,
      this.emptyValidation = true,
      this.emptyValidationText,
      this.requiredValidationText,
      this.autoValidation = false,
      this.isSuffixNeeded = true,
      this.isRequiredField = false,
      this.isEnabled = true,
      this.isCharacters = false,
      this.isCustomBox = false,
      this.isAssessmentBox = false,
      this.regExp});

  @override
  State<InputBoxWidget> createState() => _InputBoxWidgetState();
}

class _InputBoxWidgetState extends State<InputBoxWidget> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: widget.isRequiredField!
              ? RichText(
                  text: TextSpan(children: [
                  TextSpan(
                    text: widget.labelText!,
                    style: labelText,
                  ),
                  TextSpan(
                      text: " *",
                      style: TextStyle(fontSize: 14.sp, color: requiredColor))
                ]))
              : RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: widget.labelText!, style: labelText)
                    ],
                  ),
                ),
        ),
        SizedBox(height: 5.h),
        Container(
          constraints: BoxConstraints(minHeight: 50.h),
          width: widget.width!.w,
          child: TextFormField(
            textAlign: TextAlign.start,
            onChanged: (value) {
              if (widget.onChangedCallback != null) {
                widget.onChangedCallback!(value);
              }
            },
            enabled: widget.isEnabled,
            onSaved: (saveValue) => widget.onSaveFunction!(saveValue!),
            onFieldSubmitted: widget.validationLogic,
            autovalidateMode: widget.autoValidation!
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            keyboardType: widget.numberKeyboard
                ? const TextInputType.numberWithOptions(
                    decimal: true, signed: false)
                : TextInputType.visiblePassword,
            inputFormatters: [
              widget.numberKeyboard
                  ? LengthLimitingTextInputFormatter(10)
                  : widget.isCharacters!
                      ? LengthLimitingTextInputFormatter(20)
                      : LengthLimitingTextInputFormatter(50),
              widget.numberKeyboard
                  ? FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  : widget.isCharacters!
                      ? FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z\s]"),
                        )
                      : FilteringTextInputFormatter(
                          RegExp(r'^[\u0020-\u007E]+$'),
                          allow: true)
            ],
            validator: (value) {
              if (widget.emptyValidation) {
                if (value!.isEmpty) {
                  return widget.emptyValidationText != null
                      ? "${widget.emptyValidationText} is required"
                      : "Field is required";
                } else {
                  return widget.validationLogic!(value);
                }
              } else {
                if (value!.isNotEmpty) {
                  return widget.validationLogic!(value);
                }
              }
              return null;
            },
            controller: widget.inputBoxController,
            style: inputBoxTextStyle.copyWith(
                color: widget.isCustomBox!
                    ? textBoxBackground
                    : widget.isEnabled!
                        ? labelTextColor
                        : Colors.grey,
                overflow: TextOverflow.ellipsis),
            cursorColor: primaryColor,
            cursorWidth: 1.0,
            obscureText: widget.isPassword ? isPasswordVisible : false,
            decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor),
                    borderRadius: widget.isAssessmentBox!
                        ? BorderRadius.circular(10.0)
                        : widget.isCustomBox!
                            ? BorderRadius.circular(20.0)
                            : BorderRadius.circular(40.0)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor),
                    borderRadius: widget.isAssessmentBox!
                        ? BorderRadius.circular(10.0)
                        : widget.isCustomBox!
                            ? BorderRadius.circular(20.0)
                            : BorderRadius.circular(40.0)),
                errorStyle: errorTextStyle_12,
                hintText: widget.hintText,
                hintStyle: cardSmallText.copyWith(
                    color: widget.isCustomBox! ? Colors.black54 : cardTextColor,
                    overflow: TextOverflow.ellipsis),
                filled: true,
                fillColor: widget.isCustomBox == true
                    ? const Color.fromRGBO(217, 217, 217, 1)
                    : cardColor,
                isDense: true,
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.isEnabled == false
                            ? Colors.grey
                            : textBoxBackground),
                    borderRadius: widget.isAssessmentBox!
                        ? BorderRadius.circular(10.0)
                        : widget.isCustomBox!
                            ? BorderRadius.circular(20.0)
                            : BorderRadius.circular(40.0)),
//contentPadding: const EdgeInsets.all(16.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.isEnabled == false
                            ? Colors.white
                            : textBoxBackground),
                    borderRadius: widget.isAssessmentBox!
                        ? BorderRadius.circular(10.0)
                        : widget.isCustomBox!
                            ? BorderRadius.circular(20.0)
                            : BorderRadius.circular(40.0)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.isEnabled == false
                            ? Colors.white
                            : textBoxBackground),
                    borderRadius: widget.isAssessmentBox!
                        ? BorderRadius.circular(10.0)
                        : widget.isCustomBox!
                            ? BorderRadius.circular(20.0)
                            : BorderRadius.circular(40.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor),
                    borderRadius: widget.isAssessmentBox!
                        ? BorderRadius.circular(10.0)
                        : widget.isCustomBox!
                            ? BorderRadius.circular(20.0)
                            : BorderRadius.circular(40.0)),
                contentPadding: widget.isCustomBox!
                    ? const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 12.0)
                    : widget.isAssessmentBox!
                        ? EdgeInsets.only(left: 5.0.r)
                        : const EdgeInsets.fromLTRB(20, 10, 20, 20),
                suffixIcon: widget.isSuffixNeeded!
                    ? widget.isPassword
                        ? IconButton(
                            splashRadius: 1.0,
                            icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18.0,
                                color: primaryColor),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.suffixText!,
                                  style: TextStyle(
                                      color: cardColor, fontSize: 14.sp))
                            ],
                          )
                    : null),
          ),
        ),
        const SizedBox(height: 10.0)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'package:test_app/generated/assets.dart';
import 'custom_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? labelText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPress;
  final VoidCallback? fieldClick;
  final Function(String)? onChanged;

  // final InputDecoration? decoration = const InputDecoration();
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSize;
  final double? suffixIconSizeWidth;
  final double? suffixIconSizeHeight;
  final double? errorTextHeight;
  final double? hintTextSize;
  final double? height;
  final double? weight;
  final double? radius;
  final Function(String)? onSaved;
  final bool? isEmail;
  final bool isPassword;
  final bool isSecure;
  final bool readOnly;
  final double? borderThink;
  final TextInputAction? textInputAction;
  final TextStyle? errorStyle;
  final Color? underLineBorderColor;
  final FocusNode? focusNode;
  final bool isError;
  final bool isOptional;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;

  const CustomTextField({
    super.key,
    this.title,
    this.hint,
    this.labelText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onPress,
    this.errorText,
    this.prefixIconColor,
    this.suffixIconColor,
    this.fillColor,
    this.hintColor,
    this.onSaved,
    this.keyboardType,
    this.isEmail,
    this.borderThink,
    this.validation,
    this.prefixIconSize,
    this.suffixIconSizeWidth,
    this.suffixIconSizeHeight,
    this.onChanged,
    this.errorTextHeight,
    this.textColor,
    this.hintTextSize,
    this.height,
    this.weight,
    this.radius,
    this.fieldClick,
    this.borderColor,
    this.isPassword = false,
    this.isSecure = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.errorStyle,
    this.underLineBorderColor,
    this.focusNode,
    this.isError = false,
    this.isOptional = true,
    this.hintStyle,
    this.titleStyle,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = widget.isSecure;
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != null ? true : false,
          child: Row(
            children: [
              Text(
                widget.title ?? "",
                style: widget.titleStyle ??
                    kBodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              widget.isOptional
                  ? Transform.translate(
                      offset: const Offset(2, -4),
                      child: SvgPicture.asset(
                        Assets.iconsStar,
                        width: 9.r,
                        height: 9.r,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          readOnly: widget.readOnly,
          autofocus: true,
          textAlign: TextAlign.start,
          obscureText: isVisible,
          cursorColor: AppColors.kTextPrimaryColor,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscuringCharacter: "*",
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          style: kBodyMedium.copyWith(
            color: widget.textColor ?? AppColors.kGrayColor,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
          onTap: widget.fieldClick ?? () {},
          inputFormatters: [
            if (widget.keyboardType == TextInputType.number) ...[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d{0,6})?$')),
            ] else if (widget.keyboardType == TextInputType.text) ...[
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9 ]*")),
            ]
          ],
          decoration: InputDecoration(
            labelText: widget.labelText ?? "",
            labelStyle: const TextStyle(color: Colors.black),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.height ?? 17.h,
              horizontal: widget.weight ?? 16.w,
            ),
            counter: const Offstage(),
            isDense: false,
            prefixIconConstraints: BoxConstraints.tight(
              Size(
                widget.prefixIconSize ?? 45.r,
                widget.prefixIconSize ?? 45.r,
              ),
            ),
            suffixIconConstraints: BoxConstraints.tight(
              Size(
                widget.suffixIconSizeWidth ?? 45.r,
                widget.suffixIconSizeHeight ?? 45.r,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? RPadding(
                    padding: REdgeInsets.only(right: 18.w),
                    child: InkWell(
                      onTap: _toggleVisibility,
                      child: isVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: AppColors.kGrayColor600,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: AppColors.kGrayColor600,
                            ),
                    ),
                  )
                : widget.suffixIcon == null
                    ? null
                    : InkWell(
                        onTap: widget.onPress,
                        child: widget.suffixIcon,
                      ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(widget.radius ?? 30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kErrorColor
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: widget.borderThink ?? 2.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 30).r,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 5.w,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 30).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.kErrorColor
                    : widget.borderColor ?? AppColors.kBorderColor,
                width: widget.borderThink ?? 2.0,
              ),
              borderRadius: BorderRadius.circular(widget.radius ?? 30).r,
            ),
            filled: true,
            errorStyle: const TextStyle(height: 0),
            hintStyle: widget.hintStyle ??
                TextStyle(
                  fontSize: widget.hintTextSize ?? 16.sp,
                  color: widget.hintColor ?? AppColors.kTextHintColor,
                  fontWeight: FontWeight.w400,
                ),
            hintText: widget.hint ?? "",
            errorText: widget.errorText,
            fillColor: widget.fillColor ?? AppColors.kGrayColor50,
          ),
          validator: widget.validation as String? Function(String?)?,
          onSaved: widget.onSaved as String? Function(String?)?,
        ),
      ],
    );
  }
}

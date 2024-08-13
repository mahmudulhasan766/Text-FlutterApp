import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'custom_button.dart';

showCustomDialog({
  required BuildContext context,
  required VoidCallback onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
  bool isCancelDisable = false,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: IntrinsicHeight(
          child: Container(
            padding: REdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: AppColors.kWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: kTitleMedium,
                ),
                if (details != null) ...[
                  12.verticalSpace,
                  Text(
                    details,
                    style: kLabelLarge.copyWith(color: AppColors.kGrayColor600),
                  ),
                ],
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!isCancelDisable) ...[
                      SizedBox(
                        width: 1.sw / 4.5,
                        child: CustomButton(
                          onPress: () => Navigator.of(context).pop(),
                          title: cancelText ?? "Cancel",
                          textColor: AppColors.kGrayColor900,
                          btnColor: AppColors.kGrayColor100,
                          radius: 8.r,
                          padding: 0,
                        ),
                      ),
                      16.horizontalSpace,
                    ],
                    SizedBox(
                      width: 1.sw / 4.5,
                      child: CustomButton(
                        onPress: () {
                          Navigator.of(context).pop();
                          onYes();
                        },
                        title: confirmText ?? "Yes",
                        textColor: AppColors.kGrayColor900,
                        radius: 8.r,
                        padding: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

successAlert({
  required BuildContext context,
  required VoidCallback onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
  bool isCancelDisable = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop(true);
      });
      return Dialog(
        child: IntrinsicHeight(
          child: Container(
            padding: REdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,
              color: AppColors.kWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                8.verticalSpace,
                Text(
                  title ?? "",
                  style: kTitleMedium.copyWith(color: AppColors.kGrayColor600),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

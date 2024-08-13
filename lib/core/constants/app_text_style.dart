import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app/core/constants/app_colors.dart';

//font family
String kInterFontFamily = 'Inter';

//font Weights
FontWeight lightFont = FontWeight.w300;
FontWeight regularFont = FontWeight.w400;
FontWeight semiBoldFont = FontWeight.w600;
FontWeight boldFont = FontWeight.w700;
FontWeight extraBoldFont = FontWeight.w800;
FontWeight blackBoldFont = FontWeight.w900;

//App Text Size start
final kHeadLineLarge = TextStyle(
  fontSize: 32.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);

final kHeadLineMedium = TextStyle(
  fontSize: 24.sp,
  fontWeight: boldFont,
  height: 1.28,
  color: AppColors.kTextPrimaryColor,
);
final kHeadLineSmall = TextStyle(
  fontSize: 16.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);

final kTitleLarge = TextStyle(
  fontSize: 20.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);
final kTitleMedium = TextStyle(
  fontSize: 16.sp,
  fontWeight: boldFont,
  height: 1.3,
  color: AppColors.kTextPrimaryColor,
);
final kTitleSmall = TextStyle(
  fontSize: 14.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);

final kBodyLarge = TextStyle(
  fontSize: 16.sp,
  fontWeight: regularFont,
  height: 1.4,
  color: AppColors.kTextPrimaryColor,
);
final kBodyMedium = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
  height: 1.4,
  color: AppColors.kTextPrimaryColor,
);
final kBodySmall = TextStyle(
  fontSize: 12.sp,
  fontWeight: regularFont,
  height: 1.3,
  color: AppColors.kTextPrimaryColor,
);

final kLabelLarge = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
  height: 1.3,
  color: AppColors.kTextPrimaryColor,
);
final kLabelMedium = TextStyle(
  fontSize: 12.sp,
  fontWeight: regularFont,
  height: 1.15,
  color: AppColors.kTextPrimaryColor,
);
final kLabelSmall = TextStyle(
  fontSize: 10.sp,
  fontWeight: regularFont,
  height: 1.1,
  color: AppColors.kTextPrimaryColor,
);

final kButtonTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: semiBoldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);

final kLargeProminent = TextStyle(
  fontSize: 20.sp,
  fontWeight: boldFont,
  height: 1.2,
  color: AppColors.kTextPrimaryColor,
);
final kRegularLine22 = TextStyle(
  fontSize: 22.sp,
  fontWeight: regularFont,
);
final kRegularLine18 = TextStyle(
  fontSize: 18.sp,
  fontWeight: regularFont,
);
final kRegularLine20 = TextStyle(
  fontSize: 20.sp,
  fontWeight: regularFont,
);

final kRegularLine16 = TextStyle(
  fontSize: 16.sp,
  fontWeight: regularFont,
);
final kRegularLine15 = TextStyle(
  fontSize: 15.sp,
  fontWeight: regularFont,
);
final kRegularLine14 = TextStyle(
  fontSize: 14.sp,
  fontWeight: regularFont,
);

final kSmallLine13 = TextStyle(
  fontSize: 13.sp,
  fontWeight: regularFont,
);
final kSmallLine12 = TextStyle(
  fontSize: 12.sp,
  fontWeight: regularFont,
);



Widget textShimmer({double? width,double? height}){
  return Shimmer.fromColors(
    baseColor: AppColors.kGrayColor200,
    highlightColor: AppColors.kWhiteColor,
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.kGrayColor200,
        borderRadius: BorderRadius.circular(3.r)
      ),
      height:height?? 24.h,
      width: width?? 1.sw,
    ),
  );
}


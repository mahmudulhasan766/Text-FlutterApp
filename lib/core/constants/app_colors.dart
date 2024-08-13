import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  //App PrimaryColors
  static const kPrimaryMeatBrownColor = Color(0xFFE9BE41);
  static const kMeatBrown500 = Color(0xFFE9BE41);

  //App Secondary colors
  static const kSecondaryRichBlackColor = Color(0xFF0C0524);
  static const kRichBlack900 = Color(0xFF0C0524);

  //App Neutral Colors
  static const kGrayColor = Color(0xFF979693);
  static const kGrayColor800 = Color(0xFF3F3E3C);
  static const kGrayColor200 = Color(0xFFE4E3E2);
  static const kGrayColor100 = Color(0xFFF5F5F4);
  static const kGrayColor50 = Color(0xFFFAFAFA);

  //App Semantic Colors
  static const kErrorColor = Color(0xFFDC3545);
  static const kRedColor = Color(0xFFEF1F17);
  static const kWarningColor = Color(0xFFF37F20);
  static const kSuccessColor = Color(0xFF36BA1C);
  static const kBodyColor = Color(0xFF333E48);

  //button color
  static const kButtonPrimaryColor = Color(0xFF29323A);
  static const kButtonSecondaryColor = Color(0xFFEFECEC);
  static const kWhiteColor = Colors.white;
  static const kDividerColor = Color(0xFFD8D3D3);
  static const kLinkColor = Color(0xFF208DF3);
  static const kGrayColor900 = Color(0xFF252422);
  static const kGrayColor600 = Color(0xFF787673);


  //Text field
  static const kTextPrimaryColor = Color(0xFF333E48);
  static const kBorderColor = Color(0xFFDDDDDD);
  static const kTransparentColor = Colors.transparent;
  static const kTextColor = Color(0xFF7C7C7C);
  static const kPrimaryColor = Color(0xFFFED700);
  static const kTextHintColor = Color(0xFF7C7C7C);


  static const blue = Color(0xFF0062BD);
  static const blue2 = Color(0xF00C8071);
  static const white = Color(0xFFFFFFFF);
  static const kBlackColor = Colors.black;

  static final cardShadow = BoxShadow(
    color: kGrayColor200.withOpacity(0.9),
    blurRadius: 30,
    offset: const Offset(0, 4),
    spreadRadius: 0,
  );
  static final kOrdinaryShadow = BoxShadow(
    color: kGrayColor.withOpacity(.12),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 1),
  );

  static final kBackGroundShadow = BoxShadow(
    color: const Color(0xFFABB0AC).withOpacity(0.25),
    blurRadius: 70,
    offset: const Offset(0, 4),
    spreadRadius: 0,
  );


  static final BoxDecoration decoration = BoxDecoration(
    color: kGrayColor50,
    borderRadius: BorderRadius.circular(8).r,
    boxShadow: [
      BoxShadow(
        color: const Color(0xFFE0E1E0).withOpacity(1),
        blurRadius: 52,
        offset: const Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
}

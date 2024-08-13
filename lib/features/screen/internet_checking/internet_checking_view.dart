import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'package:test_app/features/screen/components/custom_svg.dart';
import 'package:test_app/features/screen/internet_checking/cubit/internet_cubit.dart';
import 'package:test_app/generated/assets.dart';

class InternetCheckingScreen extends StatelessWidget {
  const InternetCheckingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state.status == NetworkState.connected) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSvg(
                    icon: Assets.iconsNoInternet,
                    color: AppColors.kErrorColor,
                    size: 100.r,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.noInternetConnection.tr(),
                    style: kTitleMedium,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

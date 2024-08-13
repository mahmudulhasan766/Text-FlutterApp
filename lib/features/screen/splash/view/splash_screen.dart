
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app/app_dependency.dart';
import 'package:test_app/core/app/app_preference.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/features/router/routes.dart';
import 'package:test_app/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  final AppPreferences _appPreferences;
  SplashScreen({super.key}) : _appPreferences = instance.get();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _navigation);
  }
  void _navigation() async {
    String token = await widget._appPreferences.getUserAuthToken();
    if (token.isNotEmpty) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.product, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.login, (route) => false);
    }
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                width: 170.r,
                height: 170.r,
                Assets.imagesLogo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

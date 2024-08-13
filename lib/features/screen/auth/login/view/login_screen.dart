import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_print.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'package:test_app/features/screen/components/custom_button.dart';
import 'package:test_app/features/screen/components/custom_dialogs.dart';
import 'package:test_app/features/screen/components/custom_svg.dart';
import 'package:test_app/features/screen/components/custom_text_field.dart';
import 'package:test_app/generated/assets.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.isBackEnable = false});

  final bool isBackEnable;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  final emailFocus = FocusNode();
  final passWordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.isBackEnable,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        } else {
          showCustomDialog(
            context: context,
            title: "exitAppAlertTitle",
            onYes: () {
              SystemNavigator.pop();
            },
          );
        }
      },
      child: Scaffold(
        body: RPadding(
          padding: REdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomSvg(
                        icon: Assets.iconsProfile,
                        size: 90.r,
                        color: AppColors.kTextPrimaryColor,
                      ),
                      SizedBox(height: 40.h),
                      Container(
                        width: 1.sw,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.login.tr(),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kTextPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: context.read<LoginCubit>().emailController,
                        labelText: AppStrings.email.tr(),
                        hint: AppStrings.email.tr(),
                        radius: 10,
                        isEmail: true,
                        hintColor: AppColors.kGrayColor,
                        textColor: AppColors.kTextPrimaryColor,
                        focusNode: emailFocus,
                        onChanged: (val) {
                          printLog(val);
                        },
                        validation: (value) {},
                        fillColor: AppColors.kTransparentColor,
                      ),
                      SizedBox(height: 6.h),
                      CustomTextField(
                        controller: context.read<LoginCubit>().passController,
                        labelText: AppStrings.password.tr(),
                        hint: AppStrings.password.tr(),
                        radius: 10,
                        isEmail: true,
                        hintColor: AppColors.kGrayColor,
                        textColor: AppColors.kTextPrimaryColor,
                        isPassword: true,
                        isSecure: true,
                        focusNode: context.read<LoginCubit>().focusNodePass,
                        onChanged: (val) {
                          context.read<LoginCubit>().checkEmptyField();
                        },
                        validation: (value) {},
                        fieldClick: () {
                          context.read<LoginCubit>().checkEmptyField();
                          FocusScope.of(context).requestFocus(
                              context.read<LoginCubit>().focusNodePass);
                        },
                        underLineBorderColor:
                            !state.emailValid ? AppColors.kErrorColor : null,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: state.isTermsAndConditions,
                            splashRadius: 4,
                            onChanged: (value) {
                              context
                                  .read<LoginCubit>()
                                  .termsAndConditionsUpdate(value!);
                            },
                            fillColor: WidgetStateProperty.resolveWith(
                              (states) {
                                return state.isTermsAndConditions
                                    ? AppColors.kLinkColor
                                    : AppColors.kWhiteColor;
                              },
                            ),
                          ),
                          Text(
                            AppStrings.iAcceptAllTermsOfThisService.tr(),
                            style: kLabelLarge,
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 1.sw,
                        child: CustomButton(
                          radius: 5,
                          padding: 20.r,
                          title: AppStrings.login.tr(),
                          textColor: state.inputStatus == InputStatus.filled &&
                                  state.isTermsAndConditions
                              ? AppColors.kWhiteColor
                              : AppColors.kBlackColor,
                          btnColor: state.inputStatus == InputStatus.filled &&
                                  state.isTermsAndConditions
                              ? AppColors.kButtonPrimaryColor
                              : AppColors.kButtonSecondaryColor,
                          onPress: state.inputStatus == InputStatus.filled &&
                                  state.isTermsAndConditions
                              ? () async {
                                  await context.read<LoginCubit>().loggedIn();
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

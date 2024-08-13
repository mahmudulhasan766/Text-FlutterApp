import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app/app_context.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'package:test_app/core/constants/strings.dart';
import 'package:test_app/features/screen/cart/cart_cubit/cart_cubit.dart';
import 'package:test_app/features/screen/components/custom_button.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';

class PopUp extends StatelessWidget {
  final List<ProductResponse>? products;

  const PopUp({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 1.sw - 40,
            height: 1.sh - 80,
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppStrings.checkoutConfirmScreen.tr(),
                  style: kButtonTextStyle,
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: products?.length,
                    itemBuilder: (context, index) {
                      ProductResponse? product = products?.elementAt(index);
                      return Container(
                        //height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.kGrayColor200,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${product?.name ?? " "} (${product?.price ?? ""}*${product?.quantity ?? ""})",
                                style: kLabelLarge,
                                maxLines: 3,
                              ),
                            ),
                            Text(
                              "৳${double.parse(product?.price ?? "") * product!.quantity}",
                      style: kLabelLarge.copyWith(color: AppColors.kRedColor),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 1.sw,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(5.r),
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    color: AppColors.kGrayColor200,
                  ),
                  child: Text("${AppStrings.total.tr()} ${context.read<CartCubit>().totalPrice}$kCurrency",style: kBodyLarge.copyWith(color: AppColors.kRedColor,fontWeight: FontWeight.w600),),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onPress: () {
                        GetContext.back();
                      },
                      radius: 5.r,
                      btnColor: AppColors.kGrayColor600,
                      title: AppStrings.edit.tr(),
                      textStyle:
                          kRegularLine14.copyWith(color: AppColors.kWhiteColor),
                    ),
                    SizedBox(width: 10.w),
                    CustomButton(
                      onPress: () {},
                      radius: 5.r,
                      btnColor: AppColors.kWarningColor,
                      title: AppStrings.orderConfirm.tr(),
                      textStyle:
                          kRegularLine14.copyWith(color: AppColors.kWhiteColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

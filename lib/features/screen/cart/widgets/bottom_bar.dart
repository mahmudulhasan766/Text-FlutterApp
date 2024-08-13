import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'package:test_app/core/constants/strings.dart';
import 'package:test_app/features/screen/cart/cart_cubit/cart_cubit.dart';
import 'package:test_app/features/screen/cart/widgets/checkout_view.dart';
import 'package:test_app/features/screen/components/custom_button.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';

class BottomBar extends StatelessWidget {
  final List<ProductResponse>? products;
  const BottomBar({super.key,this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.blue2,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
          topLeft: Radius.circular(15.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${AppStrings.total.tr()} : ${context.read<CartCubit>().totalPrice}$kCurrency",
            style: kRegularLine16.copyWith(color: AppColors.kWhiteColor),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 1.sw,
            //height: 45.h,
            child: CustomButton(
              onPress: () {
                Navigator.of(context).push(PageRouteBuilder(
                  opaque: true,
                  pageBuilder: (BuildContext context, _, __) {
                    return PopUp(products: products);
                  },
                ));
              },
              radius: 5.r,
              btnColor: AppColors.kWarningColor,
              title: AppStrings.order.tr(),
              textStyle:
              kRegularLine14.copyWith(color: AppColors.kWhiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

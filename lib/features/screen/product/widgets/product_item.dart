import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/core/constants/app_text_style.dart';
import 'package:test_app/core/constants/strings.dart';
import 'package:test_app/features/screen/cart/cart_cubit/cart_cubit.dart';
import 'package:test_app/features/screen/components/custom_image.dart';
import 'package:test_app/features/screen/components/custom_svg.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';
import 'package:test_app/generated/assets.dart';

class ProductItem extends StatelessWidget {
  final ProductResponse? products;
  final bool isCart = false;
  const ProductItem({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 15.w,
          ),
          decoration: AppColors.decoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 80.h,
                    child: CustomImage(
                      baseUrl: "",
                      radius: 5.r,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          products?.name ?? "",
                          style: kRegularLine14.copyWith(
                              fontWeight: FontWeight.w500),
                          maxLines: 2,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "$kCurrency ${products?.price ?? ""}",
                              style: kSmallLine13.copyWith(
                                color: AppColors.blue2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Text(
                                "||",
                                style: kSmallLine13.copyWith(
                                    color: AppColors.blue2),
                              ),
                            ),
                            Text(
                              "${AppStrings.stock.tr()} ${products?.stockQty ?? ""} ${products?.unitName ?? ""}",
                              style:
                                  kSmallLine13.copyWith(color: AppColors.blue2),
                            )
                          ],
                        ),
                        Text(
                          "${AppStrings.masterPack.tr()} ${products?.packSize ?? ""}",
                          style: kSmallLine13,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CartCubit>().addProduct(products!);
                    },
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.circular(50.r),
                        boxShadow: [AppColors.kOrdinaryShadow],
                      ),
                      child: const CustomSvg(
                        icon: Assets.iconsShoppingCart,
                        color: AppColors.kBlackColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

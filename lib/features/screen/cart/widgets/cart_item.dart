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

class CartItem extends StatelessWidget {
  final ProductResponse? products;

  const CartItem({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 1.sw,
              //height: 150.h,
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
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 80.h,
                        child: CustomImage(
                          baseUrl: "",
                          radius: 5.r,
                        ),
                        //child: const CustomImage(baseUrl: "https://longdan.co.uk/cdn/shop/products/4502195_1000x.png?v=1656056159"),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            products?.name ?? "",
                            style: kRegularLine14.copyWith(
                                fontWeight: FontWeight.w500),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "$kCurrency ${products?.price ?? ""}",
                                style: kSmallLine13.copyWith(
                                    color: AppColors.blue2,
                                    fontWeight: FontWeight.w600),
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
                                  style: kSmallLine13.copyWith(
                                      color: AppColors.blue2))
                            ],
                          ),
                          Text("${AppStrings.masterPack.tr()} ${products?.packSize ?? ""}",
                              style: kSmallLine13)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100.w,
                        alignment: Alignment.center,
                        child: Text(
                          "",
                          style: kRegularLine14.copyWith(
                              color: AppColors.kButtonPrimaryColor),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          if (products!.quantity > 1) {
                            context
                                .read<CartCubit>()
                                .decrementItemById(id: products?.id);
                          } else if (products!.quantity == 1) {
                            context
                                .read<CartCubit>()
                                .removeItemById(id: products?.id);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.kGrayColor800,
                            boxShadow: [AppColors.kOrdinaryShadow],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.r),
                            child: CustomSvg(
                              icon: Assets.iconsRemmov,
                              size: 15.r,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.kWhiteColor,
                          boxShadow: [AppColors.cardShadow],
                        ),
                        child: Text(
                          products!.quantity.toString(),
                          style: kLabelMedium.copyWith(
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<CartCubit>()
                              .incrementItemById(id: products?.id);
                        },
                        borderRadius: BorderRadius.circular(5.r),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.kGrayColor800,
                            boxShadow: [AppColors.kOrdinaryShadow],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.r),
                            child: CustomSvg(
                              icon: Assets.iconsAdd,
                              size: 15.r,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

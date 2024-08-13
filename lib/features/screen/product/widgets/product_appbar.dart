import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app/app_context.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/features/router/routes.dart';
import 'package:test_app/features/screen/auth/login/cubit/login_cubit.dart';
import 'package:test_app/features/screen/cart/cart_cubit/cart_cubit.dart';

class ProductAppbar extends StatelessWidget implements PreferredSizeWidget{
  const ProductAppbar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: AppBar(
        title: Text(AppStrings.allProduct.tr()),
        centerTitle: false,
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: InkWell(
                  onTap: () {
                    GetContext.toNamed(route: Routes.cart);
                  },
                  radius: 10.r,
                  borderRadius: BorderRadius.circular(10.r),
                  splashColor: AppColors.blue2.withOpacity(0.2),
                  child: Badge(
                    padding: EdgeInsets.symmetric(horizontal: 5.r),
                    label: Text("${cartState.cartProductList.length ?? "0"}"),
                    backgroundColor: AppColors.kGrayColor600,
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              context.read<LoginCubit>().logOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

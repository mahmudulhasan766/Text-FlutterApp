import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/app_print.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/features/screen/auth/login/cubit/login_cubit.dart';
import 'package:test_app/features/screen/components/custom_text_field.dart';
import 'package:test_app/features/screen/product/cubit/product_cubit.dart';
import 'package:test_app/features/screen/product/widgets/product_appbar.dart';
import 'package:test_app/features/screen/product/widgets/product_item.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductAppbar(),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextField(
                  controller: context.read<ProductCubit>().searchController,
                  hint: AppStrings.searchProduct.tr(),
                  radius: 10.r,
                  hintColor: AppColors.kGrayColor,
                  textColor: AppColors.kTextPrimaryColor,
                  prefixIconSize: 50,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.kGrayColor600,
                    ),
                  ),
                  onChanged: (val) {
                    context.read<ProductCubit>().searchProducts(query: val);
                  },
                  validation: (value) {},
                  fillColor: AppColors.kTransparentColor,
                ),
              ),
              Expanded(
                child:ListView.builder(
                  itemCount: state.searchProductList.isNotEmpty?state.searchProductList.length:state.productList.length,
                  itemBuilder: (context, index) {
                    return ProductItem(products: state.searchProductList.isNotEmpty?state.searchProductList[index] : state.productList[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

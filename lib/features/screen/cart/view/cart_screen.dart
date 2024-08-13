import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/features/screen/cart/cart_cubit/cart_cubit.dart';
import 'package:test_app/features/screen/cart/widgets/bottom_bar.dart';
import 'package:test_app/features/screen/cart/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.cart.tr()),
          ),
          body: state.cartProductList.isNotEmpty
              ? ListView.builder(
                  itemCount: state.cartProductList.length,
                  itemBuilder: (context, index) {
                    return CartItem(products: state.cartProductList[index]);
                  },
                )
              : Center(child: Text(AppStrings.noCartItem.tr())),
          bottomNavigationBar: BottomBar(products: state.cartProductList ?? []),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/app/app_dependency.dart';
import 'package:test_app/features/screen/auth/login/cubit/login_cubit.dart';
import 'package:test_app/features/screen/cart/cart_cubit/cart_cubit.dart';
import 'package:test_app/features/screen/internet_checking/cubit/internet_cubit.dart';
import 'package:test_app/features/screen/product/cubit/product_cubit.dart';
import 'package:test_app/features/screen/theme/cubit/theme_cubit.dart';


class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<InternetCubit>(
        create: (BuildContext context) => instance<InternetCubit>()),
    BlocProvider<LoginCubit>(
        create: (BuildContext context) => instance<LoginCubit>()),
    BlocProvider<ProductCubit>(
        create: (BuildContext context) => instance<ProductCubit>()),
    BlocProvider<CartCubit>(
        create: (BuildContext context) => instance<CartCubit>()),
  ];
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/screen/auth/login/view/login_screen.dart';
import 'package:test_app/features/screen/cart/view/cart_screen.dart';
import 'package:test_app/features/screen/product/view/product_screen.dart';
import 'package:test_app/features/screen/splash/view/splash_screen.dart';

class Routes {
  // global routes
  static const String splash = "/";
  static const String product = "/product";
  static const String login = "/login";
  static const String cart = "/cart";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // global routes start
      case Routes.splash:
        return CupertinoPageRoute(
          builder: (_) => SplashScreen(),
          settings: routeSettings,
        );

      case Routes.product:
        return CupertinoPageRoute(
          builder: (_) => const ProductScreen(),
          settings: routeSettings,
        );

      case Routes.login:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
          settings: routeSettings,
        );

      case Routes.cart:
        return CupertinoPageRoute(
          builder: (_) => const CartScreen(),
          settings: routeSettings,
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No page Found"),
        ),
        body: const Center(
          child: Text("No page Found"),
        ),
      ),
    );
  }
}

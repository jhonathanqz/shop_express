import 'package:flutter/material.dart';

import 'package:shop_express/presentation/features/loading/pages/loading_page.dart';
import 'package:shop_express/presentation/features/products/pages/product_page.dart';
import 'package:shop_express/presentation/features/products/pages/products_page.dart';
import 'package:shop_express/presentation/features/splash/pages/splash_page.dart';

class AppModule {
  static String get initialRoute => '/splash';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (_) => const SplashPage(),
    '/products': (_) => const ProductsPage(),
    '/product_details': (_) => const ProductPage(),
    '/loading': (_) => const LoadingPage(),
  };

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

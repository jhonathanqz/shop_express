import 'package:flutter/material.dart';

import 'package:shop_express/main.dart';
import 'package:shop_express/presentation/features/products/pages/products_page.dart';

class AppModule {
  static String get initialRoute => '/splash';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (_) => const MyHomePage(
          title: 'Shop Express',
        ),
    '/products': (_) => const ProductsPage(),
  };

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

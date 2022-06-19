import 'package:flutter/material.dart';

import 'package:shop_express/app/app_module.dart';
import 'package:shop_express/app/cool_navigate.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Express',
      theme: AppModule.theme,
      initialRoute: AppModule.initialRoute,
      routes: AppModule.routes,
      navigatorKey: NavigationService.navigationKey,
      debugShowCheckedModeBanner: false,
      //showPerformanceOverlay: true,
    );
  }
}

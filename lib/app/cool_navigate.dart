import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final NavigationService coolNavigate = NavigationService();

class NavigationService<T, U> {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  Future navigateTo(String routeName, {Object? args}) async =>
      navigationKey.currentState!.pushNamed<T>(
        routeName,
        arguments: args,
      );
  Future push(Route<T> route) async =>
      navigationKey.currentState!.push<T>(route);
  Future pushReplacementNamed(String routeName, {Object? args}) async =>
      navigationKey.currentState!.pushReplacementNamed<T, U>(
        routeName,
        arguments: args,
      );
  Future<void> removeUntil(
    String routeName, {
    Object? args,
    bool keepPreviousPages = false,
  }) async =>
      navigationKey.currentState?.pushNamedAndRemoveUntil<T>(
        routeName,
        (Route<dynamic> route) => keepPreviousPages,
        arguments: args,
      );

  Future pushAndRemoveUntil(
    Route<T> route, {
    bool keepPreviousPages = false,
  }) async =>
      navigationKey.currentState!.pushAndRemoveUntil<T>(
        route,
        (Route<dynamic> route) => keepPreviousPages,
      );
  bool canPop() => navigationKey.currentState!.canPop();
  void goBack({T? result}) => navigationKey.currentState!.pop<T>(result);
}

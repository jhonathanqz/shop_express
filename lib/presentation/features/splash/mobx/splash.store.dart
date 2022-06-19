import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:shop_express/app/cool_navigate.dart';
import 'package:shop_express/presentation/shared/helpers/dialog_helper.dart';
import 'package:shop_express/presentation/shared/widgets/alert/alert_connection_error.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

part 'splash.store.g.dart';

class SplashStore = SplashBase with _$SplashStore;

abstract class SplashBase with Store {
  @action
  Future<void> dismissSplashScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet(
        lookUpAddress: 'google.com');

    if (!isConnected) {
      return DialogHelper.open(
        context: context,
        content: AlertConnectionError(
          message: 'Não conseguimos conexão com a internet.',
          onTap: () async {
            coolNavigate.goBack();
            await dismissSplashScreen(context);
          },
          textButton: 'Tentar novamente',
        ),
      );
    }

    coolNavigate.pushReplacementNamed('/products');
  }
}

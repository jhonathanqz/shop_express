import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/widgets/loading/loading.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: Loading(
          isLoading: true,
          child: Container(),
        ),
      ),
    );
  }
}

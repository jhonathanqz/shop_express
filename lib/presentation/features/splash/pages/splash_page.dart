import 'package:flutter/material.dart';

import 'package:shop_express/app/injection_container.dart';
import 'package:shop_express/presentation/features/splash/mobx/splash.store.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashStore splashStore;

  var _opacity = 0.0;
  Future<void> showLogo() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    setState(() => _opacity = 1.0);
  }

  @override
  void initState() {
    splashStore = sl<SplashStore>();
    showLogo();
    splashStore.dismissSplashScreen(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    splashStore = sl<SplashStore>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  AppImages.splash,
                  fit: BoxFit.fill,
                ),
                //child: Image.asset('assets/${asset}logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

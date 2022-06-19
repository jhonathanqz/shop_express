import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';

@immutable
class AppBarWidget extends PreferredSize {
  AppBarWidget({
    Key? key,
    required String title,
    Widget? leading,
    Function? leadingOnTap,
    BuildContext? context,
    required Widget widget,
    PreferredSizeWidget? bottom,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: AppColors.appBarColor,
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            leading: leading,
            actions: [widget],
            bottom: bottom,
          ),
        );
}

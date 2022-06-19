import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

class SnackHelper {
  static void showSnackInformation(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 3,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.textSnackInformation,
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }

  static void showSnackDark(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 3,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.textSnackInformation.copyWith(
            color: AppColors.black,
          ),
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }

  static void removeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  static void showSnackException(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 5,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.textSnackInformation,
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }
}

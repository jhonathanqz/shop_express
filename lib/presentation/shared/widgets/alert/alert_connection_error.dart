import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_input_border.dart';
import 'package:shop_express/presentation/shared/style/app_size.dart';
import 'package:shop_express/presentation/shared/style/app_spacing.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

@immutable
class AlertConnectionError extends StatelessWidget {
  final String message;
  final Function() onTap;
  final String textButton;
  const AlertConnectionError({
    Key? key,
    required this.message,
    required this.onTap,
    required this.textButton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        backgroundColor: AppColors.white,
        title: Container(
          padding: AppEdgeInsets.vsd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.wifi_off,
                  size: AppSize.plusSize,
                ),
              ),
              AppSpacing.md,
              SizedBox(
                child: Text(
                  message,
                  style: AppTextStyles.titleBold.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: onTap,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration: AppInputBorder.borderRadius.copyWith(
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton,
                  style: AppTextStyles.titleButton.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

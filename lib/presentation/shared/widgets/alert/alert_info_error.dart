import 'package:flutter/material.dart';

import 'package:shop_express/app/cool_navigate.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_input_border.dart';
import 'package:shop_express/presentation/shared/style/app_size.dart';
import 'package:shop_express/presentation/shared/style/app_spacing.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

@immutable
class AlertInfo extends StatelessWidget {
  final String message;
  final Function() function;
  final String textButton;
  final String backTextButton;
  final String title;
  final bool isBackButton;
  final IconData icon;
  final Color colorButton;
  const AlertInfo({
    Key? key,
    required this.title,
    required this.message,
    required this.function,
    this.textButton = 'Finalizar',
    this.backTextButton = 'Cancelar',
    this.isBackButton = false,
    required this.colorButton,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppInputBorder.borderRadiusAll,
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    icon,
                    size: AppSize.t56,
                  ),
                ),
                AppSpacing.sm,
                Center(
                  child: Text(
                    title,
                    style: AppTextStyles.titleBold.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Container(
                    padding: AppEdgeInsets.tmd,
                    child: Text(
                      message,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //content: Visibility(
      //  visible: isBackButton,
      //  child: ButtonPrimary(
      //    colorButton: colorButton,
      //    onTap: function,
      //    title: textButton!,
      //  ),
      //),
      actions: [
        Visibility(
          visible: isBackButton,
          child: InkWell(
            onTap: () {
              coolNavigate.goBack();
            },
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  backTextButton,
                  style: AppTextStyles.titleButton,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: InkWell(
            onTap: function,
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
        ),
      ],
    );
  }
}

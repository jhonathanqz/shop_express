import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_spacing.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

@immutable
class ButtonPrimary extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool loading;
  final Color? colorButton;
  final Color? colorText;
  final bool elevation;
  final bool isEnabled;
  final bool isEnabledIcon;
  final IconData? iconButton;
  final Color? colorIcon;

  const ButtonPrimary({
    Key? key,
    required this.onTap,
    required this.title,
    this.loading = false,
    this.colorButton,
    this.colorText,
    this.elevation = false,
    this.isEnabled = true,
    this.isEnabledIcon = false,
    this.iconButton,
    this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled
          ? loading
              ? null
              : onTap
          : null,
      child: SizedBox(
        //padding: AppEdgeInsets.vmd,
        height: 50,
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: isEnabled
              ? colorButton ?? AppColors.primaryColor
              : const Color.fromARGB(255, 211, 208, 208),
          elevation: elevation ? 5.0 : 0.0,
          child: Center(
            child: loading
                ? _loading
                : isEnabledIcon
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            iconButton ?? Icons.check,
                            color: colorIcon ?? Colors.white,
                          ),
                          AppSpacing.minW,
                          Text(
                            title,
                            style: AppTextStyles.titleButton.copyWith(
                              color: isEnabled
                                  ? colorText ?? AppColors.black
                                  : Colors.grey[700],
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Text(
                        title,
                        style: AppTextStyles.titleButton.copyWith(
                          color: isEnabled
                              ? colorText ?? AppColors.white
                              : Colors.grey[700],
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
          ),
        ),
      ),
    );
  }

  Widget get _loading => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              isEnabled ? Colors.white : Colors.black),
        ),
      );
}

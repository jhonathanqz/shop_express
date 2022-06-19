import 'package:flutter/material.dart';

import 'package:shop_express/app/cool_navigate.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

class OmniHeader extends StatelessWidget {
  const OmniHeader({
    Key? key,
    this.logo = 'assets/images/logo_login.png',
    this.onTapClose,
    this.onTapBack,
    this.isBackButton = true,
    this.isCloseButton = true,
    this.widgetAction,
    this.title,
  }) : super(key: key);
  final String logo;
  final Function? onTapClose;
  final Function? onTapBack;
  final bool isBackButton;
  final bool isCloseButton;
  final String? title;
  final IconData? widgetAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isBackButton
            ? Container(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 56.0),
                child: Image.asset(
                  logo,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 122,
                ),
              )
            : GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                onTap: () {
                  if (onTapBack != null) {
                    onTapBack!();
                    return;
                  }
                  coolNavigate.goBack();
                },
              ),
        Visibility(
          visible: title != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              title ?? '',
              style: AppTextStyles.title,
            ),
          ),
        ),
        !(widgetAction != null && !isCloseButton)
            ? Visibility(
                visible: isCloseButton && widgetAction == null,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColors.primaryColor,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (onTapClose != null) {
                      onTapClose!();
                      return;
                    }
                    coolNavigate.goBack();
                  },
                ),
              )
            : GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.primaryColor,
                    ),
                    child: Icon(
                      widgetAction,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                onTap: () {
                  if (onTapClose != null) {
                    onTapClose!();
                    return;
                  }
                  coolNavigate.goBack();
                },
              ),
      ],
    );
  }
}

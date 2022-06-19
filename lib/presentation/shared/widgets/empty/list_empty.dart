import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_images.dart';
import 'package:shop_express/presentation/shared/style/app_size.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({
    Key? key,
    required this.message,
    this.isEnabledImage = false,
    this.image,
  }) : super(key: key);
  final String message;
  final String? image;
  final bool isEnabledImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppEdgeInsets.sdAll,
      child: Center(
        child: isEnabledImage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppSize.plusSize,
                    width: AppSize.plusSize,
                    child: Image.asset(image ?? AppImages.empty),
                  ),
                  Text(
                    message,
                    style: AppTextStyles.titleButton,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                message,
                style: AppTextStyles.titleButton,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_size.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.photoUrl,
    this.stockText,
    this.height,
    this.width,
    this.boxfit,
  }) : super(key: key);
  final String photoUrl;
  final String? stockText;

  final double? height;
  final double? width;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: AppEdgeInsets.rsd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: stockText != null ? 80 : 90,
                height: stockText != null ? 80 : 90,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Image.asset(photoUrl),
                ),
              ),
            ),
            stockText != null
                ? Container(
                    width: AppSize.plusSize,
                    padding: AppEdgeInsets.minAll,
                    margin: AppEdgeInsets.tmin,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      stockText!,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

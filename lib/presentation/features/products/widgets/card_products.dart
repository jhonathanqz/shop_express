import 'package:flutter/material.dart';

import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/presentation/features/products/widgets/product_image.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_input_border.dart';
import 'package:shop_express/presentation/shared/style/app_size.dart';
import 'package:shop_express/presentation/shared/style/app_spacing.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({
    Key? key,
    required this.descricao,
    required this.barcode,
    required this.stockText,
    required this.fullPrice,
    required this.onTap,
    required this.onTapButton,
    required this.increaseFn,
    required this.decreaseFn,
    required this.product,
    required this.quantity,
    this.isConsult = false,
  }) : super(key: key);
  final String descricao;
  final String barcode;
  final String stockText;
  final String fullPrice;
  final Function() onTap;
  final Function() onTapButton;
  final Function() increaseFn;
  final Function() decreaseFn;
  final Product product;
  final double quantity;
  final bool isConsult;

  @override
  Widget build(BuildContext context) {
    final deleteButton = GestureDetector(
      child: const Icon(Icons.more_horiz),
      onTap: () {},
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: AppEdgeInsets.sdAll,
        decoration: AppInputBorder.borderRadius,
        child: Container(
          margin: AppEdgeInsets.sdAll,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProductImage(
                photoUrl: 'assets/images/${product.fileName}',
                boxfit: BoxFit.contain,
                height: AppSize.size75,
                width: AppSize.size75,
              ),
              Flexible(
                //flex: 1,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            deleteButton,
                          ],
                        ),
                        const Text(
                          "Sweet fresh stawberry on the wooden table",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: AppColors.black,
                            fontSize: 13,
                          ),
                        ),
                        AppSpacing.min,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              padding: AppEdgeInsets.minStockAll,
                              child: Text(
                                product.type,
                                style: AppTextStyles.title.copyWith(
                                  color: AppColors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: AppEdgeInsets.vsd,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            fullPrice,
                            style: AppTextStyles.titleBold.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !isConsult,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          AppSpacing.xlW,
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: onTapButton,
                              child: Container(
                                padding: AppEdgeInsets.addProductButton,
                                decoration:
                                    AppInputBorder.borderRadius.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    'Comprar',
                                    style: AppTextStyles.titleButton.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

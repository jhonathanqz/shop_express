import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.product,
    required this.moreOntap,
  }) : super(key: key);

  final Product product;
  final Function(String)? moreOntap;

  List<Widget> startList = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < product.rating; i++) {
      startList.add(
        const Icon(
          Icons.grade,
          size: 20,
          color: AppColors.primaryColor,
        ),
      );
    }

    for (var i = product.rating; i < 5; i++) {
      startList.add(
        const Icon(
          Icons.grade,
          size: 20,
          color: AppColors.grey,
        ),
      );
    }

    final productImage = Image.asset(
      'assets/images/${product.fileName}',
      fit: BoxFit.contain,
      height: 75,
      width: 75,
    );

    final productName = Text(
      product.title,
      maxLines: 2,
      style: AppTextStyles.medium16(
        textColor: AppColors.primaryTextColor,
        fontWeight: FontWeight.w700,
      ),
    );

    final productType = product.type != ''
        ? Text(
            product.type,
            style: AppTextStyles.small14(
              textColor: AppColors.primaryTextColor,
            ),
          )
        : const SizedBox();

    final productPrice = RichText(
      text: TextSpan(
        text: "R\$ ${NumberFormat("#,##0.00", "pt_BR").format(product.price)}",
        style: AppTextStyles.medium16(
          textColor: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final moreButton = PopupMenuButton(
      onSelected: moreOntap,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'editar',
          child: Text('Editar'),
        ),
        const PopupMenuItem(
          value: 'excluir',
          child: Text('Excluir'),
        ),
      ],
      child: const Icon(Icons.more_horiz),
    );

    final productDetail = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        productName,
        productType,
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 15,
                child: Row(
                  children: startList,
                ),
              ),
            ),
            productPrice,
          ],
        ),
        //OmniSpacing.space30,
      ],
    );

    final cardContent = Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: productImage,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: productDetail),
                    moreButton,
                  ],
                ),
                //productQuantityAndTotal
              ],
            ),
          ),
        ],
      ),
    );

    final cardBody = Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: cardContent,
    );

    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      margin: AppEdgeInsets.vmin,
      child: cardBody,
    );
  }
}

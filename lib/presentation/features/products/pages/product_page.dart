import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_express/app/cool_navigate.dart';
import 'package:shop_express/app/injection_container.dart';
import 'package:shop_express/presentation/features/products/mobx/product.store.dart';
import 'package:shop_express/presentation/features/products/widgets/card_img_product_details.dart';
import 'package:shop_express/presentation/features/products/widgets/card_product_details.dart';
import 'package:shop_express/presentation/shared/helpers/dialog_helper.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/widgets/alert/alert_info_error.dart';
import 'package:shop_express/presentation/shared/widgets/button/button_primary.dart';
import 'package:shop_express/presentation/shared/widgets/scaffold/scaffold_primary.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductStore productStore;
  late ReactionDisposer reactionEditProduct;

  @override
  void initState() {
    productStore = sl<ProductStore>();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    productStore = sl<ProductStore>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    productStore.selectedProduct = null;
    reactionEditProduct.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            coolNavigate.goBack();
            return false;
          },
          child: ScaffoldPrimary(
            isLoading: productStore.isLoading,
            title: 'Editar produto',
            footer: Container(
              margin: AppEdgeInsets.tsd,
              color: AppColors.primaryColor,
              child: ButtonPrimary(
                colorButton: AppColors.primaryColor,
                title: 'Salvar Edição',
                onTap: () => _showProductUpdated(),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: productStore.selectedProduct!.uuid,
                    child: CardImgProductDetails(
                        url:
                            'assets/images/${productStore.selectedProduct!.fileName}'),
                  ),
                  const CardProductDetails(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showProductUpdated() {
    return DialogHelper.open(
      context: context,
      content: AlertInfo(
        title: 'Atenção',
        message: 'Confirma edição do produto?',
        textButton: 'Sim',
        backTextButton: 'Não',
        isBackButton: true,
        function: () async {
          coolNavigate.goBack();
          productStore.setProductUpdated();
          await productStore.editProduct();
          coolNavigate.goBack();
        },
        colorButton: AppColors.primaryColor,
        icon: Icons.error,
      ),
    );
  }
}

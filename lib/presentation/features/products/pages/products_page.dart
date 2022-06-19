import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_express/app/cool_navigate.dart';
import 'package:shop_express/app/injection_container.dart';
import 'package:shop_express/presentation/features/products/mobx/product.store.dart';
import 'package:shop_express/presentation/features/products/widgets/product_card.dart';
import 'package:shop_express/presentation/shared/helpers/dialog_helper.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';
import 'package:shop_express/presentation/shared/widgets/alert/alert_info_error.dart';
import 'package:shop_express/presentation/shared/widgets/button/button_primary.dart';
import 'package:shop_express/presentation/shared/widgets/scaffold/scaffold_primary.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductStore productStore;
  late ReactionDisposer reactionUpdated;
  late ReactionDisposer reactionGetProducts;

  @override
  void initState() {
    productStore = sl<ProductStore>();

    reactionGetProducts = autorun(
      (_) async => await productStore.getProducts(),
    );

    reactionUpdated = reaction(
      (_) => productStore.isProductUpdatedFunction,
      (_) async {
        if (productStore.isProductUpdatedFunction) {
          await productStore.getProducts();
          productStore.isProductUpdatedFunction = false;
        }
      },
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    productStore = sl<ProductStore>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    reactionGetProducts.call();
    reactionUpdated.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ScaffoldPrimary(
          isLoading: productStore.isLoading,
          title: 'Produtos',
          isAction: productStore.products.isEmpty ? false : true,
          widgetAction: IconButton(
            onPressed: () {
              DialogHelper.open(
                context: context,
                content: AlertInfo(
                  title: 'Atenção!',
                  message: 'Deseja excluir todos os produtos da base de dados?',
                  textButton: 'Sim',
                  backTextButton: 'Não',
                  isBackButton: true,
                  function: () async {
                    coolNavigate.goBack();
                    await productStore.deleteAllProducts();
                  },
                  colorButton: AppColors.primaryColor,
                  icon: Icons.error,
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: AppEdgeInsets.sdAll,
            child: productStore.products.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          'Nenhum produto foi encontrado na base de dados.\n\nPor favor, clique no botão abaixo para que inicie uma base de dados.',
                          style: AppTextStyles.title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ButtonPrimary(
                        onTap: () async {
                          await productStore.initProducts();
                        },
                        title: 'Iniciar base de dados',
                      ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: productStore.products.length,
                    itemBuilder: (context, index) {
                      final prod = productStore.products[index];
                      return ProductCard(
                        product: prod,
                        moreOntap: (c) async {
                          await productStore.moreFunctions(
                            product: prod,
                            action: c,
                            context: context,
                          );
                        },
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}

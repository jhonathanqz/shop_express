import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:shop_express/app/cool_navigate.dart';
import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/use_cases/delete_all_products_use_case.dart';
import 'package:shop_express/domain/use_cases/delete_product_use_case.dart';
import 'package:shop_express/domain/use_cases/edit_product_use_case.dart';
import 'package:shop_express/domain/use_cases/get_product_use_case.dart';
import 'package:shop_express/domain/use_cases/init_products_use_case.dart';
import 'package:shop_express/domain/use_cases/save_product_use_case.dart';
import 'package:shop_express/presentation/shared/helpers/dialog_helper.dart';
import 'package:shop_express/presentation/shared/style/app_colors.dart';
import 'package:shop_express/presentation/shared/widgets/alert/alert_info_error.dart';
import 'package:shop_express/presentation/utils/helpers/debug_helper.dart';

part 'product.store.g.dart';

class ProductStore = ProductBase with _$ProductStore;

abstract class ProductBase with Store {
  final GetProductUseCase getProductUseCase;
  final EditProductUseCase editProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final SaveProductUseCase saveProductUseCase;
  final InitProductUseCase initProductUseCase;
  final DeleteAllProductsUseCase deleteAllProductsUseCase;

  ProductBase({
    required this.getProductUseCase,
    required this.editProductUseCase,
    required this.deleteProductUseCase,
    required this.saveProductUseCase,
    required this.initProductUseCase,
    required this.deleteAllProductsUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  Product? selectedProduct;

  @observable
  List<Product> products = [];

  @observable
  String productType = '';

  @observable
  String productTitle = '';

  @observable
  double productPrice = 0;

  @observable
  bool isProductUpdatedFunction = false;

  @action
  void setisProductUpdatedFunction(bool value) =>
      isProductUpdatedFunction = value;

  @action
  void setProductType(String value) => productType = value;

  @action
  void setProductTitle(String value) => productTitle = value;

  @action
  void setProductPrice(double value) {
    productPrice = value;
  }

  @computed
  bool get isProductUpdated =>
      (productTitle != selectedProduct!.title) ||
      (productType != selectedProduct!.type) ||
      (productPrice != selectedProduct!.price);

  @action
  void setProductUpdated() {
    if (productTitle.trim() != '') {
      selectedProduct = selectedProduct!.copyWith(title: productTitle.trim());
    }
    if (productType.trim() != '') {
      selectedProduct = selectedProduct!.copyWith(type: productType.trim());
    }
    if (productPrice != 0) {
      selectedProduct = selectedProduct!.copyWith(price: productPrice);
    }
  }

  @action
  Future<void> getProducts() async {
    try {
      isLoading = true;

      final response = await getProductUseCase.call();
      products = response;

      isLoading = false;
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'getProducts',
      );
    }

    isLoading = false;
  }

  @action
  Future<void> editProduct() async {
    if (selectedProduct == null) return;
    try {
      isLoading = true;

      print('****Editando para: $selectedProduct');
      await editProductUseCase.call(
        product: selectedProduct!,
      );

      _wipeFieldsProductEdit();

      isProductUpdatedFunction = true;

      isLoading = false;
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'editProducts',
      );
    }
    isLoading = false;
  }

  @action
  Future<void> deleteProduct({
    required String uuid,
  }) async {
    try {
      isLoading = true;

      await deleteProductUseCase.call(
        uuid: uuid,
      );
      isProductUpdatedFunction = true;

      isLoading = false;
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'deleteProduct',
      );
    }
    isLoading = false;
  }

  @action
  Future<void> saveProduct({
    required Product product,
  }) async {
    try {
      isLoading = true;
      //
      await saveProductUseCase.call(product: product);
      //coolNavigate.goBack();
      isLoading = false;
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'saveProduct',
      );
    }
    isLoading = false;
  }

  @action
  Future<void> initProducts() async {
    try {
      isLoading = true;

      await initProductUseCase.call();

      isLoading = false;

      isProductUpdatedFunction = true;
    } catch (e) {
      isLoading = false;
    }
    //isLoading = false;
  }

  @action
  Future<void> deleteAllProducts() async {
    try {
      isLoading = true;

      await deleteAllProductsUseCase.call(
        productList: products,
      );

      isLoading = false;
      isProductUpdatedFunction = true;
    } catch (e) {
      isLoading = false;
    }
    // isLoading = false;
  }

  @action
  Future<void> moreFunctions({
    required Product product,
    required String action,
    required BuildContext context,
  }) async {
    if (action == 'editar') {
      selectedProduct = product;
      setProductPrice(product.price);
      setProductTitle(product.title);
      setProductType(product.type);
      return coolNavigate.navigateTo('/product_details');
    }
    if (action == 'excluir') {
      return DialogHelper.open(
        context: context,
        content: AlertInfo(
          title: 'Atenção!\nConfirma a exclusão do produto?',
          message: product.title,
          function: () async {
            coolNavigate.goBack();
            await deleteProduct(uuid: product.uuid);
          },
          colorButton: AppColors.primaryColor,
          icon: Icons.error,
          textButton: 'Sim',
          backTextButton: 'Não',
          isBackButton: true,
        ),
      );
    }
  }

  void _wipeFieldsProductEdit() {
    productPrice = 0;
    productTitle = '';
    productType = '';
  }
}

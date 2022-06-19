// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on ProductBase, Store {
  Computed<bool>? _$isProductUpdatedComputed;

  @override
  bool get isProductUpdated => (_$isProductUpdatedComputed ??= Computed<bool>(
          () => super.isProductUpdated,
          name: 'ProductBase.isProductUpdated'))
      .value;

  final _$isLoadingAtom = Atom(name: 'ProductBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$selectedProductAtom = Atom(name: 'ProductBase.selectedProduct');

  @override
  Product? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(Product? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  final _$productsAtom = Atom(name: 'ProductBase.products');

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$productTypeAtom = Atom(name: 'ProductBase.productType');

  @override
  String get productType {
    _$productTypeAtom.reportRead();
    return super.productType;
  }

  @override
  set productType(String value) {
    _$productTypeAtom.reportWrite(value, super.productType, () {
      super.productType = value;
    });
  }

  final _$productTitleAtom = Atom(name: 'ProductBase.productTitle');

  @override
  String get productTitle {
    _$productTitleAtom.reportRead();
    return super.productTitle;
  }

  @override
  set productTitle(String value) {
    _$productTitleAtom.reportWrite(value, super.productTitle, () {
      super.productTitle = value;
    });
  }

  final _$productPriceAtom = Atom(name: 'ProductBase.productPrice');

  @override
  double get productPrice {
    _$productPriceAtom.reportRead();
    return super.productPrice;
  }

  @override
  set productPrice(double value) {
    _$productPriceAtom.reportWrite(value, super.productPrice, () {
      super.productPrice = value;
    });
  }

  final _$isProductUpdatedFunctionAtom =
      Atom(name: 'ProductBase.isProductUpdatedFunction');

  @override
  bool get isProductUpdatedFunction {
    _$isProductUpdatedFunctionAtom.reportRead();
    return super.isProductUpdatedFunction;
  }

  @override
  set isProductUpdatedFunction(bool value) {
    _$isProductUpdatedFunctionAtom
        .reportWrite(value, super.isProductUpdatedFunction, () {
      super.isProductUpdatedFunction = value;
    });
  }

  final _$getProductsAsyncAction = AsyncAction('ProductBase.getProducts');

  @override
  Future<void> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$editProductAsyncAction = AsyncAction('ProductBase.editProduct');

  @override
  Future<void> editProduct() {
    return _$editProductAsyncAction.run(() => super.editProduct());
  }

  final _$deleteProductAsyncAction = AsyncAction('ProductBase.deleteProduct');

  @override
  Future<void> deleteProduct({required String uuid}) {
    return _$deleteProductAsyncAction
        .run(() => super.deleteProduct(uuid: uuid));
  }

  final _$saveProductAsyncAction = AsyncAction('ProductBase.saveProduct');

  @override
  Future<void> saveProduct({required Product product}) {
    return _$saveProductAsyncAction
        .run(() => super.saveProduct(product: product));
  }

  final _$initProductsAsyncAction = AsyncAction('ProductBase.initProducts');

  @override
  Future<void> initProducts() {
    return _$initProductsAsyncAction.run(() => super.initProducts());
  }

  final _$deleteAllProductsAsyncAction =
      AsyncAction('ProductBase.deleteAllProducts');

  @override
  Future<void> deleteAllProducts() {
    return _$deleteAllProductsAsyncAction.run(() => super.deleteAllProducts());
  }

  final _$moreFunctionsAsyncAction = AsyncAction('ProductBase.moreFunctions');

  @override
  Future<void> moreFunctions(
      {required Product product,
      required String action,
      required BuildContext context}) {
    return _$moreFunctionsAsyncAction.run(() => super
        .moreFunctions(product: product, action: action, context: context));
  }

  final _$ProductBaseActionController = ActionController(name: 'ProductBase');

  @override
  void setisProductUpdatedFunction(bool value) {
    final _$actionInfo = _$ProductBaseActionController.startAction(
        name: 'ProductBase.setisProductUpdatedFunction');
    try {
      return super.setisProductUpdatedFunction(value);
    } finally {
      _$ProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductType(String value) {
    final _$actionInfo = _$ProductBaseActionController.startAction(
        name: 'ProductBase.setProductType');
    try {
      return super.setProductType(value);
    } finally {
      _$ProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductTitle(String value) {
    final _$actionInfo = _$ProductBaseActionController.startAction(
        name: 'ProductBase.setProductTitle');
    try {
      return super.setProductTitle(value);
    } finally {
      _$ProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductPrice(double value) {
    final _$actionInfo = _$ProductBaseActionController.startAction(
        name: 'ProductBase.setProductPrice');
    try {
      return super.setProductPrice(value);
    } finally {
      _$ProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductUpdated() {
    final _$actionInfo = _$ProductBaseActionController.startAction(
        name: 'ProductBase.setProductUpdated');
    try {
      return super.setProductUpdated();
    } finally {
      _$ProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedProduct: ${selectedProduct},
products: ${products},
productType: ${productType},
productTitle: ${productTitle},
productPrice: ${productPrice},
isProductUpdatedFunction: ${isProductUpdatedFunction},
isProductUpdated: ${isProductUpdated}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on ProductBase, Store {
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
  Future<void> deleteProduct() {
    return _$deleteProductAsyncAction.run(() => super.deleteProduct());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedProduct: ${selectedProduct},
products: ${products}
    ''';
  }
}

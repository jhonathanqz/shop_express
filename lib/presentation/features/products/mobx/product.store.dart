import 'package:mobx/mobx.dart';
import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/use_cases/delete_product_use_case.dart';
import 'package:shop_express/domain/use_cases/edit_product_use_case.dart';
import 'package:shop_express/domain/use_cases/get_product_use_case.dart';
import 'package:shop_express/presentation/utils/helpers/debug_helper.dart';

part 'product.store.g.dart';

class ProductStore = ProductBase with _$ProductStore;

abstract class ProductBase with Store {
  final GetProductUseCase getProductUseCase;
  final EditProductUseCase editProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;

  ProductBase({
    required this.getProductUseCase,
    required this.editProductUseCase,
    required this.deleteProductUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  Product? selectedProduct;

  @observable
  List<Product> products = [];

  @action
  Future<void> getProducts() async {
    try {
      final response = await getProductUseCase.call();
      products = response;
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'getProducts',
      );
    }
  }

  @action
  Future<void> editProduct() async {
    try {
      await editProductUseCase.call(product: selectedProduct!);
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'editProducts',
      );
    }
  }

  @action
  Future<void> deleteProduct() async {
    try {
      deleteProductUseCase.call(uuid: selectedProduct!.uuid);
    } catch (e) {
      DebugHelper.debug(
        'ProductStore',
        e.toString(),
        function: 'deleteProduct',
      );
    }
  }
}

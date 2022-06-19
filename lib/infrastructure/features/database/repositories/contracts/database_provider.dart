import 'package:shop_express/domain/entities/product.dart';

abstract class DatabaseProvider {
  Future<void> initProducts();

  Future<List<Product>> getProducts();

  Future<void> editProduct({
    required Product product,
  });

  Future<void> deleteProduct({
    required String uuid,
  });

  Future<void> deleteAllProducts({
    required List<Product> productList,
  });

  Future<void> saveProduct({
    required Product product,
  });
}

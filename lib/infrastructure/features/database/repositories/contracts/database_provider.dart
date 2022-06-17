import 'package:shop_express/domain/entities/product.dart';

abstract class DatabaseProvider {
  Future<List<Product>> getProducts();

  Future<void> editProduct({
    required Product product,
  });

  Future<void> deleteProduct({
    required int uuid,
  });

  Future<void> saveProduct({
    required Product product,
  });
}

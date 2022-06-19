import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';
import 'package:shop_express/infrastructure/features/database/repositories/contracts/database_provider.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final DatabaseProvider databaseProvider;

  DatabaseRepositoryImpl({required this.databaseProvider});

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await databaseProvider.getProducts();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> editProduct({
    required Product product,
  }) async {
    try {
      await databaseProvider.editProduct(
        product: product,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct({
    required String uuid,
  }) async {
    try {
      await databaseProvider.deleteProduct(
        uuid: uuid,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveProduct({
    required Product product,
  }) async {
    try {
      await databaseProvider.saveProduct(
        product: product,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> initProducts() async {
    try {
      await databaseProvider.initProducts();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllProducts({
    required List<Product> productList,
  }) async {
    try {
      await databaseProvider.deleteAllProducts(
        productList: productList,
      );
    } catch (_) {
      rethrow;
    }
  }
}

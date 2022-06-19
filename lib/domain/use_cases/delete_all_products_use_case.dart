import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';

class DeleteAllProductsUseCase {
  final DatabaseRepository databaseRepository;

  DeleteAllProductsUseCase({required this.databaseRepository});

  Future<void> call({
    required List<Product> productList,
  }) async {
    try {
      await databaseRepository.deleteAllProducts(
        productList: productList,
      );
    } catch (_) {
      rethrow;
    }
  }
}

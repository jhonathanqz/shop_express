import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';

class GetProductUseCase {
  final DatabaseRepository databaseRepository;

  GetProductUseCase({required this.databaseRepository});

  Future<List<Product>> call() async {
    try {
      return await databaseRepository.getProducts();
    } catch (_) {
      rethrow;
    }
  }
}

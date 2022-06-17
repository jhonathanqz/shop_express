import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';

class SaveProductUseCase {
  final DatabaseRepository databaseRepository;

  SaveProductUseCase({required this.databaseRepository});

  Future<void> call({
    required Product product,
  }) async {
    try {
      await databaseRepository.saveProduct(
        product: product,
      );
    } catch (_) {
      rethrow;
    }
  }
}

import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';

class EditProductUseCase {
  final DatabaseRepository databaseRepository;

  EditProductUseCase({required this.databaseRepository});

  Future<void> call({
    required Product product,
  }) async {
    try {
      await databaseRepository.editProduct(
        product: product,
      );
    } catch (_) {
      rethrow;
    }
  }
}

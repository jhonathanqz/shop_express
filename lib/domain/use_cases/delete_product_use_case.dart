import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';

class DeleteProductUseCase {
  final DatabaseRepository databaseRepository;

  DeleteProductUseCase({required this.databaseRepository});

  Future<void> call({
    required int uuid,
  }) async {
    try {
      await databaseRepository.deleteProduct(
        uuid: uuid,
      );
    } catch (_) {
      rethrow;
    }
  }
}

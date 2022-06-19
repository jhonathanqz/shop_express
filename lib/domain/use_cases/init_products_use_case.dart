import 'package:shop_express/domain/repositories/database_repository.dart';

class InitProductUseCase {
  final DatabaseRepository databaseRepository;

  InitProductUseCase({required this.databaseRepository});

  Future<void> call() async {
    try {
      await databaseRepository.initProducts();
    } catch (_) {
      rethrow;
    }
  }
}

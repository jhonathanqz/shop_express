import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_express/app/client_factory.dart';
import 'package:shop_express/data/features/database/provider/database_provider_impl.dart';
import 'package:shop_express/domain/repositories/database_repository.dart';
import 'package:shop_express/domain/use_cases/delete_all_products_use_case.dart';
import 'package:shop_express/domain/use_cases/delete_product_use_case.dart';
import 'package:shop_express/domain/use_cases/edit_product_use_case.dart';
import 'package:shop_express/domain/use_cases/get_product_use_case.dart';
import 'package:shop_express/domain/use_cases/init_products_use_case.dart';
import 'package:shop_express/domain/use_cases/save_product_use_case.dart';
import 'package:shop_express/infrastructure/features/database/repositories/contracts/database_provider.dart';
import 'package:shop_express/infrastructure/features/database/repositories/database_repository_impl.dart';
import 'package:shop_express/presentation/features/products/mobx/product.store.dart';

import '../presentation/features/splash/mobx/splash.store.dart';

final sl = GetIt.I;
//final GetIt sl = GetIt.instance;

void setupDependencies() {
  setupProvider();
  setupRepository();
  setupUseCase();
  setupMobx();
}

void setupClient({
  required String host,
  required String port,
  required String token,
  required String timeOut,
}) {
  final client = ClientFactory.baseClient;
  client?.options.baseUrl = '$host:$port';
  client?.options.headers = {
    'Authorization': 'Bearer static:$token',
  };
  client!.options.followRedirects = false;
  client.options.connectTimeout = int.tryParse(timeOut)! * 1000;
  client.options.receiveTimeout = int.tryParse(timeOut)! * 2000;
  client.interceptors.add(
    PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90),
  );
}

void setupProvider() {
  sl.registerLazySingleton<DatabaseProvider>(
    () => DatabaseProviderImpl(),
    dispose: (_) => sl.resetLazySingleton<DatabaseProvider>(),
  );
}

void setupRepository() {
  sl.registerLazySingleton<DatabaseRepository>(
    () => DatabaseRepositoryImpl(
      databaseProvider: sl<DatabaseProvider>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DatabaseRepository>(),
  );
}

void setupUseCase() {
  sl.registerLazySingleton<GetProductUseCase>(
    () => GetProductUseCase(
      databaseRepository: sl<DatabaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<GetProductUseCase>(),
  );

  sl.registerLazySingleton<EditProductUseCase>(
    () => EditProductUseCase(
      databaseRepository: sl<DatabaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<EditProductUseCase>(),
  );

  sl.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(
      databaseRepository: sl<DatabaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DeleteProductUseCase>(),
  );

  sl.registerLazySingleton<SaveProductUseCase>(
    () => SaveProductUseCase(
      databaseRepository: sl<DatabaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<SaveProductUseCase>(),
  );

  sl.registerLazySingleton<InitProductUseCase>(
    () => InitProductUseCase(
      databaseRepository: sl<DatabaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<InitProductUseCase>(),
  );

  sl.registerLazySingleton<DeleteAllProductsUseCase>(
    () => DeleteAllProductsUseCase(
      databaseRepository: sl<DatabaseRepository>(),
    ),
    dispose: (_) => sl.resetLazySingleton<DeleteAllProductsUseCase>(),
  );
}

void setupMobx() {
  sl.registerLazySingleton<SplashStore>(
    () => SplashStore(),
    dispose: (_) => sl.resetLazySingleton<SplashStore>(),
  );

  sl.registerLazySingleton<ProductStore>(
    () => ProductStore(
      getProductUseCase: sl<GetProductUseCase>(),
      editProductUseCase: sl<EditProductUseCase>(),
      deleteProductUseCase: sl<DeleteProductUseCase>(),
      saveProductUseCase: sl<SaveProductUseCase>(),
      initProductUseCase: sl<InitProductUseCase>(),
      deleteAllProductsUseCase: sl<DeleteAllProductsUseCase>(),
    ),
  );
}

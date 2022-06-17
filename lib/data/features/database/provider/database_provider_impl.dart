import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_express/data/features/database/helper/database_helper.dart';
import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/infrastructure/features/database/repositories/contracts/database_provider.dart';

class DatabaseProviderImpl implements DatabaseProvider {
  late FirebaseFirestore db;

  static const String dbcollection = 'ecommerce/products';

  DatabaseProviderImpl() {
    _startProvider();
  }

  _startProvider() async {
    await _startFirestore();
    //await _readFavoritas();
  }

  _startFirestore() {
    db = DataBaseHelper.get();
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final snapshot = await db.collection(dbcollection).get();
      List<Product> prodlist = [];

      for (var doc in snapshot.docs) {
        final prod = doc.data();
        //prodlist.add(prod);
      }

      return prodlist;
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editProduct({
    required Product product,
  }) async {
    try {
      final response = await db
          .collection(dbcollection)
          .doc(product.uuid.toString())
          .update({
        'uuid': product.uuid,
        'title': product.title,
        'description': product.description,
        'type': product.type,
        'fileName': product.fileName,
        'height': product.height,
        'width': product.width,
        'price': product.price,
        'rating': product.rating,
      });
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct({
    required int uuid,
  }) async {
    try {
      await db.collection(dbcollection).doc(uuid.toString()).delete();
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveProduct({
    required Product product,
  }) async {
    try {
      final response =
          await db.collection(dbcollection).doc(product.uuid.toString()).set({
        'uuid': product.uuid,
        'title': product.title,
        'description': product.description,
        'type': product.type,
        'fileName': product.fileName,
        'height': product.height,
        'width': product.width,
        'price': product.price,
        'rating': product.rating,
      });
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}

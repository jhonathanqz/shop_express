import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_express/data/features/database/helper/database_helper.dart';
import 'package:shop_express/data/features/products/model/product_model.dart';
import 'package:shop_express/domain/entities/product.dart';
import 'package:shop_express/infrastructure/features/database/repositories/contracts/database_provider.dart';
import 'package:uuid/uuid.dart';

class DatabaseProviderImpl implements DatabaseProvider {
  late FirebaseFirestore db;

  static const String dbcollection = 'ecommerce/shop-express/products';

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
        final model = Product(
          uuid: prod['uuid'],
          title: prod['title'],
          description: prod['description'],
          type: prod['type'],
          fileName: prod['fileName'],
          price: prod['price'],
          width: prod['width'],
          height: prod['height'],
          rating: prod['rating'],
          createdAt: prod['createdAt'] ?? '',
          updatedAt: prod['updatedAt'] ?? '',
        );
        prodlist.add(model);
      }

      print('***lenght productList: ${prodlist.length}');

      return prodlist;
    } on FirebaseException catch (_) {
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
      await db.collection(dbcollection).doc(product.uuid.toString()).update({
        'uuid': product.uuid,
        'title': product.title,
        'description': product.description,
        'type': product.type,
        'fileName': product.fileName,
        'height': product.height,
        'width': product.width,
        'price': product.price,
        'rating': product.rating,
        'createdAt': product.createdAt,
        'updatedAt': DateTime.now().toString(),
      });
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct({
    required String uuid,
  }) async {
    try {
      await db.collection(dbcollection).doc(uuid).delete();
    } on FirebaseException catch (_) {
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
      //_startFirestore();
      db = FirebaseFirestore.instance;
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
        'createdAt': product.createdAt,
        'updatedAt': product.updatedAt,
      });
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> initProducts() async {
    try {
      final response = await rootBundle.loadString("assets/products.json");

      final list = jsonDecode(response) as List;

      final products = list.map((e) => ProductModel.fromJson(e)).toList();

      if (products.isNotEmpty) {
        const id = Uuid();
        for (var doc in products) {
          final prod = Product(
            uuid: id.v1(),
            title: doc.title ?? '',
            description: doc.description ?? '',
            type: doc.type ?? '',
            fileName: doc.filename ?? '',
            height: doc.height ?? 0,
            width: doc.width ?? 0,
            price: doc.price ?? 0,
            rating: doc.rating ?? 0,
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString(),
          );
          await saveProduct(product: prod);
        }
      }
    } catch (e) {
      print('Erro initProducts: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteAllProducts({
    required List<Product> productList,
  }) async {
    try {
      for (var doc in productList) {
        final prod = Product(
          uuid: doc.uuid,
          title: doc.title,
          description: doc.description,
          type: doc.type,
          fileName: doc.fileName,
          height: doc.height,
          width: doc.width,
          price: doc.price,
          rating: doc.rating,
          createdAt: doc.createdAt,
          updatedAt: doc.updatedAt,
        );
        await deleteProduct(uuid: prod.uuid);
      }
    } catch (e) {
      rethrow;
    }
  }
}

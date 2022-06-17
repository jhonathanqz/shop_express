import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static final DataBaseHelper _instance = DataBaseHelper._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DataBaseHelper._instance._firestore;
  }
}

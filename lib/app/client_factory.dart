import 'package:dio/dio.dart';

class ClientFactory {
  static Dio? _baseClient;

  static Dio? get baseClient {
    _baseClient ??= Dio();

    return _baseClient;
  }
}

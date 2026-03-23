import 'package:dio/dio.dart';


class HttpService {
  HttpService._internal();
  static final HttpService internal = HttpService._internal();

  static Dio? instance;

  static void init() {
    instance = Dio();

    final baseOptions = BaseOptions(
      connectTimeout: Duration(seconds: 20),
    );
  }

}
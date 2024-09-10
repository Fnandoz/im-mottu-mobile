import 'package:dio/dio.dart';
import 'package:dio/io.dart';


final _baseOptions = BaseOptions(
  baseUrl: 'https://gateway.marvel.com/',
  headers: {'Content-Type': 'application/json'},
  connectTimeout: const Duration(milliseconds: 30000),
  receiveTimeout: const Duration(milliseconds: 30000)
);

class HttpClient extends DioForNative {
  HttpClient() : super (_baseOptions);
}
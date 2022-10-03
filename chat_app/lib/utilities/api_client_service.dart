import 'package:dio/dio.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient _instance = ApiClient._();
  static ApiClient get instance => _instance;

  final String baseUrl = 'http://15.206.149.143:3000/';

  late Dio _dio;
  Dio get getClient => _dio;

  void initialize() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      contentType: 'application/json',
      baseUrl: baseUrl,
    );
    _dio = Dio(baseOptions);

    // Adding Interceptors
    // _dio.interceptors.add(CommonInterceptor());
  }
}

import 'package:dio/dio.dart';

import '../../utilities/export.dart';

part 'authentication_contract.dart';
part 'authentication_model.dart';

class AuthenticationRepo extends AuthenticationContract {
  AuthenticationRepo._();
  static final AuthenticationRepo instance = AuthenticationRepo._();
  final Dio dio = ApiClient.instance.getClient;

  @override
  Future<AuthenticationModel> login({
    required String email,
    required password,
  }) async {
    try {
      final Response response = await dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          },
        ),
      );
      return AuthenticationModel.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthenticationModel> register({
    required String email,
    required String password,
    required String username,
    required String name,
  }) async {
    try {
      final Response response = await dio.post(
        'auth/register',
        data: {
          "email": email,
          "password": password,
          "username": username,
          "name": name,
        },
      );
      return AuthenticationModel.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}

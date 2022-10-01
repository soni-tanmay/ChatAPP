import 'package:dio/dio.dart';

import '../../utilities/export.dart';

part 'authentication_contract.dart';

class AuthenticationRepo extends AuthenticationContract {
  AuthenticationRepo._();
  static final AuthenticationRepo instance = AuthenticationRepo._();
  final Dio dio = ApiClient.instance.getClient;

  @override
  Future<void> login({required String email, required password}) async {}

  @override
  Future<void> register() async {}
}

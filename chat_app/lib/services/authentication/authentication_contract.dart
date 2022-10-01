part of 'authentication_repo.dart';

abstract class AuthenticationContract {
  Future<AuthenticationModel> register({
    required String email,
    required String password,
    required String username,
    required String name,
  });
  Future<AuthenticationModel> login({
    required String email,
    required password,
  });
}

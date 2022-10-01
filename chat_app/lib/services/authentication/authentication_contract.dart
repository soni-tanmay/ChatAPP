part of 'authentication_repo.dart';

abstract class AuthenticationContract {
  Future<void> register();
  Future<void> login({required String email, required password});
}

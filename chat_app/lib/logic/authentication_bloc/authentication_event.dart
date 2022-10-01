// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationLogin extends AuthenticationEvent {
  final String email;
  final String password;
  AuthenticationLogin({
    required this.email,
    required this.password,
  });
}

class AuthenticationSignup extends AuthenticationEvent {
  final String email;
  final String password;
  final String username;
  AuthenticationSignup({
    required this.email,
    required this.password,
    required this.username,
  });
}

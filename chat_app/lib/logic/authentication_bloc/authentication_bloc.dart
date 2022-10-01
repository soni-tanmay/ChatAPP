import 'package:chat_app/services/app_service/app_service.dart';
import 'package:chat_app/services/authentication/authentication_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationLogin) {
        emit(AuthenticationLoading());
        emit(await login(event));
      } else if (event is AuthenticationSignup) {
        emit(AuthenticationLoading());
        emit(await signUp(event));
      }
    });
  }

  late AuthenticationModel authenticationModel;

  Future<AuthenticationState> login(AuthenticationLogin event) async {
    try {
      authenticationModel =
          await AppService.getInstance.authenticationRepo.login(
        password: event.password,
        email: event.email,
      );
      return AuthenticationSuccessfull();
    } catch (e) {
      return AuthenticationError();
    }
  }

  Future<AuthenticationState> signUp(AuthenticationSignup event) async {
    try {
      authenticationModel =
          await AppService.getInstance.authenticationRepo.register(
        username: '${event.username.trim()}@omega',
        name: event.username,
        password: event.password,
        email: event.email,
      );
      return AuthenticationSuccessfull();
    } catch (e) {
      return AuthenticationError();
    }
  }
}

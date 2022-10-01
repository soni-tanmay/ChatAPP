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

  AuthenticationModel authenticationModel = AuthenticationModel.fromJson({
    "status": "success",
    "msg": "Registration successful",
    "user": {
      "id": "7e1fb771-50e8-4a25-8047-ab3082430d9f",
      "userName": "test@omega",
      "name": "test",
      "email": "test@email.com",
      "profilePic": "https://ui-avatars.com/api/?name=test",
      "createdAt": "2022-10-01T13:58:09.750Z",
      "updateAt": "2022-10-01T13:58:09.750Z"
    },
    "accessToken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3ZTFmYjc3MS01MGU4LTRhMjUtODA0Ny1hYjMwODI0MzBkOWYiLCJlbWFpbCI6InRlc3RAZW1haWwuY29tIiwiaWF0IjoxNjY0NjMyNjkwLCJleHAiOjkwMDAxNjY0NjMyNjkwfQ.q72K88De93bfNgqhDgDdlO6t4_Uz8QZp_uN10kkjQs8",
    "refreshToken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3ZTFmYjc3MS01MGU4LTRhMjUtODA0Ny1hYjMwODI0MzBkOWYiLCJlbWFpbCI6InRlc3RAZW1haWwuY29tIiwiaWF0IjoxNjY0NjMyNjkwLCJleHAiOjE2OTYxOTAyOTB9.owuCIdIQrAIWqIApUUpxKEr5K9CzkewOD_W7pn5BKb8"
  });

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

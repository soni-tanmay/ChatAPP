import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      if (event is AuthenticationLogin) {
        login(event, emit);
      } else if (event is AuthenticationSignup) {
        signUp(event, emit);
      }
    });
  }

  Future<void> login(
    AuthenticationLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    emit(AuthenticationSuccessfull());
  }

  Future<void> signUp(
    AuthenticationSignup event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    await Future<void>.delayed(const Duration(seconds: 3));
    emit(AuthenticationSuccessfull());
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/logic/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../utilities/export.dart';

part 'authentication_card.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final ValueNotifier<bool> isSignUp = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccessfull) {
            Navigator.pushNamed(context, Navigation.homepage);
          }
        },
        child: ValueListenableBuilder(
          valueListenable: isSignUp,
          builder: (BuildContext context, bool value, Widget? child) {
            return SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    Assets.authBackgroundImage,
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Row(
                      children: [
                        Lottie.asset(
                          Assets.logo,
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'OMEGA',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        if (MediaQuery.of(context).size.width > 1200)
                          Text(
                            value
                                ? 'Already have an account'
                                : "Don't have an accout ?",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        const SizedBox(width: 10),
                        CustomButton(
                          onTap: () {
                            isSignUp.value = !value;
                          },
                          buttonText: value ? 'Log In' : 'Sign up',
                          width: 90,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: AuthenticationCard(isSignUp: value),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

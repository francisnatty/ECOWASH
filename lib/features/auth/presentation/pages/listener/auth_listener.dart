import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sm/auth_cubit.dart';
import '../../sm/auth_state.dart';

class AuthListener extends StatefulWidget {
  final Widget authenticatedRoute;
  final Widget unauthenticatedRoute;
  const AuthListener(
      {super.key,
      required this.authenticatedRoute,
      required this.unauthenticatedRoute});

  @override
  State<AuthListener> createState() => _AuthListenerState();
}

class _AuthListenerState extends State<AuthListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        // We don't need to do anything here since we're using BlocBuilder below
        // This just ensures we're listening to state changes
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          switch (state.status) {
            case AuthStatus.initial:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case AuthStatus.authenticated:
              return widget.authenticatedRoute;
            case AuthStatus.unauthenticated:
              return widget.unauthenticatedRoute;
          }
        },
      ),
    );
  }
}

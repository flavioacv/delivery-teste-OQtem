import 'package:flutter/material.dart';
import 'package:teste_delivery/app/core/mixins/emit_mixin.dart';
import 'package:teste_delivery/app/core/value_objects/password.dart';
import 'package:teste_delivery/app/modules/sign_in/data/services/sign_in_service.dart';
import 'package:teste_delivery/app/modules/sign_in/interactor/state/sign_in_state.dart';

class SignInController extends ValueNotifier<SignInState> with EmitMixin {
  final SignInService signInService;

  SignInController({
    required this.signInService,
  }) : super(SignInState.loggedOut());

  Future<void> doSignIn() async {
    emit(value.setLoading());

    final state = await signInService.doSignIn(value.signInModel);
    await Future.delayed(const Duration(seconds: 2));

    emit(state);
  }

  void setUser(String? user) {
    emit(value.setEmail(user));
  }

  void setPassword(Password password) {
    emit(value.setPassword(password));
  }
}

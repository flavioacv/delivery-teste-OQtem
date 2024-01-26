import 'package:teste_delivery/app/core/exception/app_exception.dart';
import 'package:teste_delivery/app/core/value_objects/password.dart';

import '../models/sign_in_model.dart';

sealed class SignInState {
  final SignInModel signInModel;
  final bool isLoading;
  final AppException? appException;

  const SignInState({
    required this.signInModel,
    this.isLoading = false,
    this.appException,
  });

  SignInState setFailure(AppException appException) {
    return SignInFailure(
      signInModel: signInModel,
      appException: appException,
    );
  }

  SignInState setLoading() {
    return SignInLoading(
      signInModel: signInModel,
      appException: appException,
    );
  }

  SignInState setLogged() {
    return LoggedState(
      signInModel: signInModel,
    );
  }

  SignInState setEmail(String? user) {
    return LoggedOutState(
      signInModel: signInModel.copyWith(
        user: user,
      ),
    );
  }

  SignInState setPassword(Password password) {
    return LoggedOutState(
      signInModel: signInModel.copyWith(
        password: password,
      ),
    );
  }

  factory SignInState.loggedOut() {
    return LoggedOutState(
      signInModel: SignInModel.empty(),
    );
  }
}

final class LoggedOutState extends SignInState {
  const LoggedOutState({
    required super.signInModel,
  });
}

final class LoggedState extends SignInState {
  const LoggedState({
    required super.signInModel,
    super.isLoading = false,
  });
}

final class SignInFailure extends SignInState {
  const SignInFailure({
    required super.signInModel,
    required super.appException,
    super.isLoading = false,
  });
}

final class SignInLoading extends SignInState {
  const SignInLoading({
    required super.signInModel,
    required super.appException,
    super.isLoading = true,
  });
}

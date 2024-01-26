import 'package:teste_delivery/app/core/exception/app_exception.dart';
import 'package:teste_delivery/app/core/types/type.dart';
import 'package:teste_delivery/app/modules/sign_in/interactor/exceptions/sign_in_exception.dart';
import 'package:teste_delivery/app/modules/sign_in/interactor/models/sign_in_model.dart';
import 'package:teste_delivery/app/modules/sign_in/interactor/state/sign_in_state.dart';

import 'sign_in_service.dart';

class SignInServiceImpl implements SignInService {
  Json dados = {
    "user": "teste@com.br",
    "pass": "123123123",
  };

  @override
  Future<SignInState> doSignIn(SignInModel signInModel) async {
    try {
      if (signInModel.user != dados["user"]) {
        return SignInFailure(
          signInModel: signInModel,
          appException: const SignInException(
            message: 'Email incorreto, digite novamente!',
            stackTrace: null,
          ),
        );
      }
      if (dados["pass"].toString().compareTo(signInModel.password.toString()) !=
          0) {
        return SignInFailure(
          signInModel: signInModel,
          appException: const SignInException(
            message: 'Senha incorreta, digite novamente!',
            stackTrace: null,
          ),
        );
      }

      return LoggedState(
        signInModel: signInModel,
      );
    } on AppException catch (error) {
      return SignInFailure(signInModel: signInModel, appException: error);
    }
  }
}

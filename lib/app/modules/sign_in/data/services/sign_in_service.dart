

import 'package:teste_delivery/app/modules/sign_in/interactor/models/sign_in_model.dart';
import 'package:teste_delivery/app/modules/sign_in/interactor/state/sign_in_state.dart';

abstract interface class SignInService {
  Future<SignInState> doSignIn(SignInModel signInModel);
}

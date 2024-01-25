import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/modules/sign_in/sign_in_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: SignInModule(),
    );
  }
}

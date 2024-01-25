import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/core/constants/routes/app_routes.dart';
import 'package:teste_delivery/app/modules/sign_in/ui/pages/sign_in_page.dart';

class SignInModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => const SignInPage(),
    );
  }
}

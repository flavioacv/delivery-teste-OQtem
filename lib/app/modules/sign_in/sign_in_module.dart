import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/core/constants/routes/app_routes.dart';
import 'package:teste_delivery/app/modules/sign_in/data/services/sign_in_service.dart';
import 'package:teste_delivery/app/modules/sign_in/data/services/sign_in_service_impl.dart';
import 'package:teste_delivery/app/modules/sign_in/interactor/controllers/sign_in_controller.dart';
import 'package:teste_delivery/app/modules/sign_in/ui/pages/sign_in_page.dart';

class SignInModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => SignInPage(
        signInController: Modular.get<SignInController>(),
      ),
    );
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<SignInService>(
      SignInServiceImpl.new,
    );
    i.addLazySingleton<SignInController>(
      SignInController.new,
    );
  }
}

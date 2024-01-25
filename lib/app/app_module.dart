import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/core/constants/routes/app_routes.dart';
import 'package:teste_delivery/app/modules/order/order_module.dart';
import 'package:teste_delivery/app/modules/sign_in/sign_in_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      AppRoutes.initialRoute,
      module: SignInModule(),
    );
    r.module(
      AppRoutes.orderRoute,
      module: OrderModule(),
    );
  }
}

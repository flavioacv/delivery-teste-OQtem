import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/core/constants/routes/app_routes.dart';
import 'package:teste_delivery/app/modules/order/ui/pages/order_page.dart';

class OrderModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => const OrderPage(),
    );
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/core/constants/routes/app_routes.dart';
import 'package:teste_delivery/app/modules/order/data/services/order_service_impl.dart';
import 'package:teste_delivery/app/modules/order/data/services/sign_in_service.dart';
import 'package:teste_delivery/app/modules/order/interactor/controllers/order_controller.dart';
import 'package:teste_delivery/app/modules/order/ui/pages/order_page.dart';

class OrderModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) =>
          OrderPage(orderController: Modular.get<OrderController>()),
    );
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<OrderService>(
      OrderServiceImpl.new,
    );
    i.addLazySingleton<OrderController>(
      OrderController.new,
    );
  }
}

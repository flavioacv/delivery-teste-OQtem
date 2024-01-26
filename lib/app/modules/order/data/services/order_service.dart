import 'package:teste_delivery/app/modules/order/interactor/state/order_state.dart';

abstract interface class OrderService {
  Future<OrderState> getOrders(
    OrderState orderState,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/modules/order/data/services/sign_in_service.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/order_model.dart';
import 'package:teste_delivery/app/modules/order/interactor/state/order_state.dart';

class OrderController implements Disposable {
  final OrderService orderService;

  OrderController(
    this.orderService,
  );

  final order = ValueNotifier<OrderState>(
    const OrderInitial<OrderModel>(
      orders: [],
    ),
  );

  Future<void> getOrders() async {
    order.value = order.value.setLoading();

    final state = await orderService.getOrders(order.value);
    await Future.delayed(const Duration(seconds: 3));
    order.value = state;
  }

  @override
  void dispose() {
    order.dispose();
  }
}

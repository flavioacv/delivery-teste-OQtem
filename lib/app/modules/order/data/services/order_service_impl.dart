import 'package:teste_delivery/app/core/exception/app_exception.dart';
import 'package:teste_delivery/app/modules/order/data/mocks/json_data.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/order_model.dart';
import 'package:teste_delivery/app/modules/order/interactor/state/order_state.dart';

import 'order_service.dart';

class OrderServiceImpl implements OrderService {
  @override
  Future<OrderState> getOrders(OrderState orderState) async {
    try {
      final result = orders;

      final resultOrders = result
          .map(
            OrderModel.fromMap,
          )
          .toList();

      return orderState.setLoaded(resultOrders);
    } on AppException catch (error) {
      return orderState.setFailure(error);
    }
  }
}

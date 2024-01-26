import 'package:teste_delivery/app/core/exception/app_exception.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/order_model.dart';

sealed class OrderState<T extends OrderModel> {
  final List<T> orders;
  final bool isLoading;
  final AppException? appException;

  const OrderState({
    required this.orders,
    required this.isLoading,
    this.appException,
  });

  OrderState setFailure(AppException appException) {
    return OrderFailure(
      orders: orders,
      appException: appException,
    );
  }

  OrderState setLoading() {
    return OrderLoading(
      orders: orders,
      isLoading: true,
      appException: appException,
    );
  }

  OrderState setLoaded(final List<T> orders) {
    return OrderLoaded(
      orders: orders,
    );
  }
}

final class OrderInitial<T extends OrderModel> extends OrderState {
  const OrderInitial({
    required super.orders,
  }) : super(isLoading: true);
}

final class OrderFailure extends OrderState {
  const OrderFailure({
    required super.appException,
    super.isLoading = false,
    required super.orders,
  });
}

 final class OrderLoading extends OrderState {
  const OrderLoading({
    required super.appException,
    required super.orders,
    super.isLoading = true,
  });
}

final class OrderLoaded extends OrderState {
  const OrderLoaded({
    required super.orders,
    super.appException,
  }) : super(isLoading: false);
}

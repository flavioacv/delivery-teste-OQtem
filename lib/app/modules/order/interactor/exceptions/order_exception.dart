import '../../../../core/exception/app_exception.dart';

class OrderException implements AppException {
  @override
  final String message;

  @override
  final StackTrace? stackTrace;

  const OrderException({
    required this.message,
    required this.stackTrace,
  });
}

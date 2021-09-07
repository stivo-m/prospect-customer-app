import 'package:prospect_app/infrastructure/repository/order_repository.dart';

class OrderService {
  final OrderRepository orderRepository;

  OrderService({
    required this.orderRepository,
  });
}

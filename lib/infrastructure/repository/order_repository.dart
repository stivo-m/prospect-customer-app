import 'package:connectivity/connectivity.dart';
import 'package:prospect_app/domain/core/enums.dart';
import 'package:prospect_app/infrastructure/facades/orders_facade.dart';

class OrderRepository extends IOrdersFacade {
  final ConnectivityResult connectivityResult;
  OrderRepository({
    required this.connectivityResult,
  }) : super(connectivityResult: connectivityResult);

  @override
  Future addAdditionalOrder(
      {required int orderid, required Object orderDetails}) {
    throw UnimplementedError();
  }

  @override
  Future addOrder({required Object orderDetails}) {
    throw UnimplementedError();
  }

  @override
  Future deleteOrder({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future payOrder({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future updateOrder({required int id, OrderStatus? status, Object? updates}) {
    throw UnimplementedError();
  }

  @override
  Future getOrders() {
    throw UnimplementedError();
  }
}

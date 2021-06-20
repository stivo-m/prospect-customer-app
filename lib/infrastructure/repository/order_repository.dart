import 'package:connectivity/connectivity.dart';
import 'package:prospect_app/domain/core/enums.dart';
import 'package:prospect_app/infrastructure/facades/orders_facade.dart';
import 'package:prospect_app/infrastructure/repository/cache_repository.dart';

class OrderRepository extends IOrdersFacade {
  final ConnectivityResult connectivityResult;
  final CacheRepository cacheRepository;
  OrderRepository({
    required this.connectivityResult,
    required this.cacheRepository,
  }) : super(connectivityResult: connectivityResult);

  @override
  Future addAdditionalOrder(
      {required int orderid, required Object orderDetails}) {
    // TODO: implement addAdditionalOrder
    throw UnimplementedError();
  }

  @override
  Future addOrder({required Object orderDetails}) {
    // TODO: implement addOrder
    throw UnimplementedError();
  }

  @override
  Future deleteOrder({required int id}) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future payOrder({required int id}) {
    // TODO: implement payOrder
    throw UnimplementedError();
  }

  @override
  Future updateOrder({required int id, OrderStatus? status, Object? updates}) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  @override
  Future getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}

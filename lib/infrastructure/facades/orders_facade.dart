import 'package:connectivity/connectivity.dart';
import 'package:prospect_app/domain/core/enums.dart';

abstract class IOrdersFacade {
  final ConnectivityResult connectivityResult;

  IOrdersFacade({
    required this.connectivityResult,
  });

  Future addOrder({required Object orderDetails});
  Future addAdditionalOrder({
    required int orderid,
    required Object orderDetails,
  });
  Future payOrder({required int id});
  Future updateOrder({
    required int id,
    OrderStatus status,
    Object? updates,
  });
  Future deleteOrder({required int id});
}

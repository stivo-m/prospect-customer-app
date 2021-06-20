import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:prospect_app/domain/objects/phone_number_value_object.dart';
import 'package:prospect_app/domain/objects/name_value_object.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/facades/auth_facade.dart';

class AuthRepository extends IAuthFacade {
  final ConnectivityResult connectivityResult;
  AuthRepository({required this.connectivityResult})
      : super(connectivityResult: connectivityResult);

  @override
  Future logOut() async {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data source
    }
  }

  @override
  Future<Either<String, String>> loginUser({
    required EmailAddress emailAddress,
    required String password,
  }) {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data source
    }
    throw UnimplementedError();
  }

  @override
  Future profile() {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data source
    }
    throw UnimplementedError();
  }

  @override
  Future registerUser(
      {required FullName fullName,
      required EmailAddress emailAddress,
      required String password,
      required PhoneNumber phoneNumber,
      String? role}) {
    if (connectivityResult == ConnectivityResult.none) {
      // return local data source
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // return remote data source
    }
    throw UnimplementedError();
  }
}

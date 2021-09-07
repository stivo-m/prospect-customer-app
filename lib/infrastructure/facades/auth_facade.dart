import 'package:connectivity/connectivity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/domain/objects/name_value_object.dart';
import 'package:prospect_app/domain/objects/phone_number_value_object.dart';

abstract class IAuthFacade {
  final ConnectivityResult connectivityResult;

  IAuthFacade({
    required this.connectivityResult,
  });

  Future<Either<String, String>> loginUser({
    required EmailAddress emailAddress,
    required String password,
  });
  Future registerUser({
    required FullName fullName,
    required EmailAddress emailAddress,
    required String password,
    required PhoneNumber phoneNumber,
    String? role,
  });

  Future profile();
  Future logOut();
}

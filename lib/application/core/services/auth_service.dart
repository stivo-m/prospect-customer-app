import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/facades/auth_facade.dart';

class AuthService {
  AuthService({
    required this.authFacade,
    this.authStreamController,
  });

  final IAuthFacade authFacade;
  final StreamController? authStreamController;
  final CacheService cacheService = CacheService.instance;

  Future<bool> loginWithEmailAndPassword({
    required EmailAddress emailAddress,
    required String password,
  }) async {
    final Either<String, String> tokenOrFailure = await authFacade.loginUser(
        emailAddress: emailAddress, password: password);

    if (tokenOrFailure.isRight()) {
      // save the token to shared preferences
      tokenOrFailure.fold(
        (String l) => cacheService.removeToken(),
        (String r) => cacheService.saveToken(token: r.toString()),
      );

      return true;
    } else {
      // print error
      if (authStreamController != null) {
        authStreamController!.add({'loading': false});
        tokenOrFailure.fold(
          (String l) => authStreamController!.addError(l),
          (String r) => cacheService.saveToken(token: r.toString()),
        );
      }
      // token is not available.
      cacheService.removeToken();
      // return error message (create function to show error message)

      return false;
    }
  }

  Future<bool> logOut() async {
    await authFacade.logOut();
    return cacheService.removeToken();
  }
}

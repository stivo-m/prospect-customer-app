// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/facades/auth_facade.dart';

class AuthService {
  AuthService({
    required this.authFacade,
    required this.cacheService,
  });

  final IAuthFacade authFacade;
  final CacheService cacheService;

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

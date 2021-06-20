// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:prospect_app/domain/core/asset_strings.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/facades/auth_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  AuthService({required this.authFacade});

  final IAuthFacade authFacade;

  Future<bool> loginWithEmailAndPassword({
    required EmailAddress emailAddress,
    required String password,
  }) async {
    final Either<String, String> tokenOrFailure = await authFacade.loginUser(
        emailAddress: emailAddress, password: password);

    if (tokenOrFailure.isRight()) {
      // save the token to shared preferences
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      tokenOrFailure.fold(
        (String l) => _prefs.remove(BEARER_TOKEN_KEY),
        (String r) => _prefs.setString(BEARER_TOKEN_KEY, r.toString()),
      );

      return true;
    } else {
      // token is not available.
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.remove(BEARER_TOKEN_KEY);
      // return error message (create function to show error message)

      return false;
    }
  }

  Future<bool> logOut() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await authFacade.logOut();
    return _prefs.remove(BEARER_TOKEN_KEY);
  }
}

import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/application/redux/actions/login_action.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';

class LoginViewModel {
  final Function({
    required EmailAddress emailAddress,
    required String password,
    required CacheService cacheService,
  }) onLogin;

  LoginViewModel({
    required this.onLogin,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      onLogin: ({
        required EmailAddress emailAddress,
        required String password,
        required CacheService cacheService,
      }) =>
          store.dispatch(
        LoginAction(
          emailAddress: emailAddress,
          password: password,
          cacheService: cacheService,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/redux/actions/login_action.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';

class LoginViewModel extends BaseModel<AppState> {
  Function({
    required EmailAddress emailAddress,
    required String password,
    required StreamController loginStreamController,
  })? onLogin;

  LoginViewModel.build({
    required this.onLogin,
  });

  LoginViewModel();

  @override
  LoginViewModel fromStore() => LoginViewModel.build(
        onLogin: ({
          required EmailAddress emailAddress,
          required String password,
          required StreamController loginStreamController,
        }) =>
            dispatch!(
          LoginAction(
            loginStreamController: loginStreamController,
            emailAddress: emailAddress,
            password: password,
          ),
        ),
      );
}

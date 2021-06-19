import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:prospect_app/application/core/services/auth_service.dart';
import 'package:prospect_app/application/redux/actions/fetch_user_feed.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/states/modules/user_state.dart';
import 'package:prospect_app/domain/core/asset_strings.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAction extends ReduxAction<AppState> {
  final EmailAddress emailAddress;
  final String password;
  final BuildContext buildContext;

  LoginAction({
    required this.emailAddress,
    required this.password,
    required this.buildContext,
  });
  @override
  Future<AppState?> reduce() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final Connectivity _connectivity = Connectivity();
    final ConnectivityResult _connectivityResult =
        await _connectivity.checkConnectivity();
    AuthService _authService = AuthService(
      authFacade: AuthRepository(
        connectivityResult: _connectivityResult,
      ),
    );

    // initiate login
    final bool loggedIn = await _authService.loginWithEmailAndPassword(
      emailAddress: emailAddress,
      password: password,
    );

    if (loggedIn) {
      store.dispatch(FetchuserFeed());

      return state.copyWith(
        userState: state.userState!.copyWith(
          token: _prefs.getString(BEARER_TOKEN_KEY),
          userOnlineStatus: UserOnlineStatus.ONLINE,
        ),
      );
    } else {
      // display any errors
      return state;
    }
  }
}

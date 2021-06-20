import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/core/services/auth_service.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/application/core/utils/loading_utils.dart';
import 'package:prospect_app/application/redux/actions/fetch_user_feed.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/states/modules/user_state.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/repository/auth_repository.dart';

class LoginAction extends ReduxAction<AppState> {
  final EmailAddress emailAddress;
  final String password;
  final BuildContext buildContext;
  final CacheService cacheService;

  LoginAction({
    required this.emailAddress,
    required this.password,
    required this.buildContext,
    required this.cacheService,
  });
  @override
  Future<AppState?> reduce() async {
    final Connectivity _connectivity = Connectivity();
    final ConnectivityResult _connectivityResult =
        await _connectivity.checkConnectivity();
    AuthService _authService = AuthService(
      authFacade: AuthRepository(
        connectivityResult: _connectivityResult,
      ),
      cacheService: cacheService,
    );

    // initiate login
    final bool loggedIn = await _authService.loginWithEmailAndPassword(
      emailAddress: emailAddress,
      password: password,
    );

    if (loggedIn) {
      store.dispatch(
        FetchuserFeed(
          buildContext: buildContext,
          cacheService: cacheService,
        ),
      );

      return state.copyWith(
        userState: state.userState!.copyWith(
          token: cacheService.getToken(),
          userOnlineStatus: UserOnlineStatus.ONLINE,
        ),
      );
    } else {
      // display any errors
      showError(buildContext);
      return state;
    }
  }

  @override
  FutureOr<void> before() {
    LoadingUtils.showLoadingState(context: buildContext, isLoading: true);
    return super.before();
  }

  @override
  void after() {
    LoadingUtils.showLoadingState(context: buildContext, isLoading: false);
    super.after();
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

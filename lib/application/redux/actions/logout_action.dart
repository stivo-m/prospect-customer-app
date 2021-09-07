import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:prospect_app/application/core/services/auth_service.dart';
import 'package:prospect_app/application/core/services/navigation_service.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/infrastructure/repository/auth_repository.dart';
import 'package:prospect_app/presentation/router/routes.dart';

class LogoutAction extends ReduxAction<AppState> {
  @override
  FutureOr<AppState?> reduce() async {
    final Connectivity _connectivity = Connectivity();
    final ConnectivityResult _connectivityResult =
        await _connectivity.checkConnectivity();
    NavigationService navigationService = NavigationService.instance;

    AuthService _authService = AuthService(
      authFacade: AuthRepository(
        connectivityResult: _connectivityResult,
      ),
    );

    final bool loggedOut = await _authService.logOut();
    if (loggedOut) {
      //  navigate to login screen via popping all pages and then pushing the login page
      navigationService.pushNamedAndRemoveUntil(route: LOGIN_ROUTE);
    }
  }
}

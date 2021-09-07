import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:prospect_app/application/core/services/auth_service.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/application/core/services/navigation_service.dart';
import 'package:prospect_app/application/redux/actions/user_authenticated_success_state_action.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/repository/auth_repository.dart';
import 'package:prospect_app/presentation/router/routes.dart';

class LoginAction extends ReduxAction<AppState> {
  final EmailAddress emailAddress;
  final String password;
  final StreamController? loginStreamController;

  LoginAction({
    required this.emailAddress,
    required this.password,
    this.loginStreamController,
  });
  @override
  Future<AppState?> reduce() async {
    final Connectivity _connectivity = Connectivity();
    final ConnectivityResult _connectivityResult =
        await _connectivity.checkConnectivity();
    final CacheService cacheService = CacheService.instance;
    NavigationService navigationService = NavigationService.instance;

    AuthService _authService = AuthService(
      authStreamController: loginStreamController,
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
      String? _token = cacheService.getToken();
      UserProfile? _profile = await cacheService.getUserProfile();
      loginStreamController!.add({'authenticated': true});
      store.dispatch(
        UserAuthenticatedSuccessStateAction(
          token: _token ?? '',
          userProfile: _profile,
        ),
      );

      // close stream controller
      loginStreamController!.close();
      // navigate to home page
      Future.sync(
        () => navigationService.pushReplacementNamed(route: DASHBOARD_ROUTE),
      );
    } else {
      // display any errors
      return state;
    }
  }

  @override
  FutureOr<void> before() {
    loginStreamController!.add({'loading': true});
    return super.before();
  }

  @override
  void after() {
    // loginStreamController!.add({'loading': false});

    super.after();
  }
}

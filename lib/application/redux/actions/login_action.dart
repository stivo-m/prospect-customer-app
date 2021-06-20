import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:prospect_app/application/core/services/auth_service.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';

import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/states/modules/user_state.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/infrastructure/repository/auth_repository.dart';

class LoginAction extends ReduxAction<AppState> {
  final EmailAddress emailAddress;
  final String password;
  final CacheService cacheService;
  final StreamController? loginStreamController;

  LoginAction({
    required this.emailAddress,
    required this.password,
    required this.cacheService,
    this.loginStreamController,
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

    await Future.delayed(Duration(milliseconds: 400));

    if (loggedIn) {
      // store.dispatch(
      //   FetchuserFeed(
      //     cacheService: cacheService,
      //   ),
      // );
      // loginStreamController!.add({'loading': false});
      return state.copyWith(
        userState: state.userState!.copyWith(
          token: cacheService.getToken(),
          userOnlineStatus: UserOnlineStatus.ONLINE,
        ),
      );
    } else {
      // display any errors
      return state;
    }

    // return Future.delayed(Duration(milliseconds: 600), () => state);
  }

  @override
  FutureOr<void> before() {
    loginStreamController!.add({'loading': true});
    return super.before();
  }

  @override
  void after() {
    loginStreamController!.add({'loading': false});

    // loginStreamController!.addError({'No internet connection'});
    loginStreamController!.add({'authenticated': true});

    super.after();
  }
}

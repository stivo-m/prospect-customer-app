import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/core/services/cache_service.dart';
import 'package:prospect_app/application/core/services/navigation_service.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';
import 'package:prospect_app/presentation/router/routes.dart';
import 'package:prospect_app/presentation/router/routes_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final CacheService cacheService = CacheService.instance;
  Store<AppState> _store = Store<AppState>(initialState: AppState.initial());
  String? token = cacheService.getToken();

  print(token);
  runApp(MyApp(
    store: _store,
    loggedIn: token == null || token == '' ? false : true,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final bool loggedIn;

  const MyApp({
    Key? key,
    required this.store,
    required this.loggedIn,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme(),
        initialRoute: loggedIn ? DASHBOARD_ROUTE : LOGIN_ROUTE,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: RouterGenerator.onRouteGenerate,
      ),
    );
  }
}

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/core/services/navigation_service.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';
import 'package:prospect_app/presentation/router/routes.dart';
import 'package:prospect_app/presentation/router/routes_generator.dart';

void main() {
  Store<AppState> _store = Store<AppState>(initialState: AppState.initial());
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({
    Key? key,
    required this.store,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme(),
        initialRoute: LOGIN_ROUTE,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: RouterGenerator.onRouteGenerate,
      ),
    );
  }
}

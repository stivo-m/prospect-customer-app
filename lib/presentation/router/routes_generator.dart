import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/presentation/app/customer/pages/auth/screens/login_screen.dart';
import 'package:prospect_app/presentation/app/customer/pages/dashboard/screens/dashboard_screen.dart';
import 'package:prospect_app/presentation/router/routes.dart';

class RouterGenerator {
  static Route<dynamic>? onRouteGenerate(RouteSettings? settings) {
    switch (settings!.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case DASHBOARD_ROUTE:
        return MaterialPageRoute(
          builder: (context) => CustomerDashboard(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
    }
  }
}

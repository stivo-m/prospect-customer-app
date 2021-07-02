import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/redux/actions/logout_action.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/viewmodels/pages_view_model.dart';
import 'package:prospect_app/presentation/app/customer/pages/dashboard/screens/dashboard_screen.dart';
import 'package:prospect_app/presentation/app/customer/widgets/floating_action_button.dart';
import 'package:prospect_app/presentation/router/routes.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => StoreProvider.dispatch(
              context,
              LogoutAction(),
            ),
          ),
        ],
      ),
      body: StoreConnector<AppState, PagesViewModel>(
        builder: (BuildContext context, PagesViewModel vm) {
          return pages[vm.currentIndex];
        },
      ),
      bottomNavigationBar: BottomAppBar(),
      floatingActionButton: FloatingAddActionButton(
        navigateTo: DASHBOARD_ROUTE,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

List<Widget> pages = <Widget>[
  CustomerDashboard(),
  CustomerDashboard(),
  CustomerDashboard(),
  CustomerDashboard(),
];

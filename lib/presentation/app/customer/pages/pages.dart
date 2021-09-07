import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/redux/actions/logout_action.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/viewmodels/pages_view_model.dart';
import 'package:prospect_app/presentation/app/customer/pages/dashboard/screens/dashboard_screen.dart';
import 'package:prospect_app/presentation/app/customer/widgets/floating_action_button.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';
import 'package:prospect_app/presentation/core/widgets/profile_circle_widget.dart';
import 'package:prospect_app/presentation/router/routes.dart';
import 'package:prospect_app/presentation/app/customer/widgets/bottom_app_bar.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: CircleProfileAvatar(),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: AppColors.blackColor,
            ),
            onPressed: () => StoreProvider.dispatch(
              context,
              LogoutAction(),
            ),
          ),
        ],
      ),
      body: StoreConnector<AppState, PagesViewModel>(
        converter: (Store<AppState> store) => PagesViewModel.fromStore(store),
        builder: (BuildContext context, PagesViewModel vm) {
          return pages[vm.currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavAppBar(),
      floatingActionButton: FloatingAddActionButton(
        navigateTo: DASHBOARD_ROUTE,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

List<Widget> pages = <Widget>[
  CustomerDashboard(),
  CustomerDashboard(),
  CustomerDashboard(),
  CustomerDashboard(),
];

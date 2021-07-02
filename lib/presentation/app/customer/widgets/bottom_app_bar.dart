import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/viewmodels/bottom_app_bar_view_model.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomAppBarViewModel>(
      builder: (BuildContext context, BottomAppBarViewModel vm) {
        return BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.greyColor,
          selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
          unselectedIconTheme: IconThemeData(color: AppColors.greyColor),
          type: BottomNavigationBarType.fixed,
          currentIndex: vm.currentIndex,
          onTap: (int pageIndex) => vm.onTap(index: pageIndex),
          items: vm.bottomNavItems as List<BottomNavigationBarItem>,
        );
      },
    );
  }
}

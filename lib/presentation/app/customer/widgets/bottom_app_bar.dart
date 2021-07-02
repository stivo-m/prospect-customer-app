import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/viewmodels/bottom_app_bar_view_model.dart';
import 'package:prospect_app/presentation/core/themes/themes.dart';

class BottomNavAppBar extends StatelessWidget {
  const BottomNavAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomAppBarViewModel>(
      converter: (Store<AppState> store) =>
          BottomAppBarViewModel.fromStore(store),
      builder: (BuildContext context, BottomAppBarViewModel vm) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.blackColor,
          selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
          unselectedIconTheme: IconThemeData(color: AppColors.blackColor),
          type: BottomNavigationBarType.fixed,
          currentIndex: vm.currentIndex,
          
          onTap: (int pageIndex) => vm.onTap(index: pageIndex),
          items: vm.bottomNavItems as List<BottomNavigationBarItem>,
        );
      },
    );
  }
}

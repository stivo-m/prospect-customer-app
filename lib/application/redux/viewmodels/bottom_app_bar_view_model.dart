import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/redux/actions/change_bottom_nav_item_action.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';

class BottomAppBarViewModel {
  BottomAppBarViewModel({
    required this.onTap,
    required this.currentIndex,
    required this.bottomNavItems,
  });

  Function({required int index}) onTap;
  int currentIndex;
  List bottomNavItems;

  static BottomAppBarViewModel fromStore(Store<AppState> store) {
    return BottomAppBarViewModel(
      currentIndex: store.state.bottomNavState!.currentIndex ?? 0,
      bottomNavItems: store.state.bottomNavState!.navItems ?? [],
      onTap: ({required int index}) => store.dispatch(
        ChangeBottomNavItemAction(currentIndex: index),
      ),
    );
  }
}

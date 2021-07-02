import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';

class ChangeBottomNavItemAction extends ReduxAction<AppState> {
  final int currentIndex;

  ChangeBottomNavItemAction({
    required this.currentIndex,
  });
  @override
  AppState reduce() {
    return state.copyWith(
      bottomNavState: state.bottomNavState!.copyWith(
        currentIndex: currentIndex,
      ),
    );
  }
}

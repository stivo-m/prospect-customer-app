import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';

class PagesViewModel {
  PagesViewModel({
    required this.currentIndex,
  });

  int currentIndex;

  static PagesViewModel fromStore(Store<AppState> store) {
    return PagesViewModel(
      currentIndex: store.state.bottomNavState!.currentIndex ?? 0,
    );
  }
}

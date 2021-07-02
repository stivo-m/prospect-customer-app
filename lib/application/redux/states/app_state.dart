import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prospect_app/application/redux/states/modules/bottom_nav_state.dart';
import 'package:prospect_app/application/redux/states/modules/user_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    UserState? userState,
    BottomNavState? bottomNavState,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial({
    UserState? userState,
    BottomNavState? bottomNavState,
  }) =>
      AppState(
        userState: userState ?? UserState.initial(),
        bottomNavState: bottomNavState ?? BottomNavState.initial(),
      );
}

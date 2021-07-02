import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prospect_app/presentation/app/customer/widgets/bottom_app_navigation_item.dart';

part 'bottom_nav_state.freezed.dart';
part 'bottom_nav_state.g.dart';

@freezed
@JsonSerializable()
class BottomNavState with _$BottomNavState {
  factory BottomNavState({
    int? currentIndex,
    List? navItems,
  }) = _BottomNavState;

  factory BottomNavState.fromJson(Map<String, dynamic> json) =>
      _$BottomNavStateFromJson(json);

  factory BottomNavState.initial() => BottomNavState(
        currentIndex: 0,
        navItems: bottomNavITems,
      );
}

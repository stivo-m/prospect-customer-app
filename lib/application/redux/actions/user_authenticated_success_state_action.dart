import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/states/modules/user_state.dart';
import 'package:prospect_app/domain/entities/user_profile_entity.dart';

class UserAuthenticatedSuccessStateAction extends ReduxAction<AppState> {
  final String token;
  final UserOnlineStatus? onlineStatus;
  final UserProfile? userProfile;

  UserAuthenticatedSuccessStateAction({
    required this.token,
    this.onlineStatus = UserOnlineStatus.ONLINE,
    this.userProfile,
  });
  @override
  AppState reduce() {
    return state.copyWith(
      userState: state.userState!.copyWith(
        profile: userProfile,
        token: token,
        userOnlineStatus: onlineStatus!,
      ),
    );
  }
}

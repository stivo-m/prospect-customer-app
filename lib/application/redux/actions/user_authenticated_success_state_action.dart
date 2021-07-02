import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';
import 'package:prospect_app/application/redux/states/modules/user_state.dart';

class UserAuthenticatedSuccessStateAction extends ReduxAction<AppState> {
  final String token;
  final UserOnlineStatus? onlineStatus;

  UserAuthenticatedSuccessStateAction({
    required this.token,
    this.onlineStatus = UserOnlineStatus.ONLINE,
  });
  @override
  AppState reduce() {
    return state.copyWith(
      userState: state.userState!.copyWith(
        token: token,
        userOnlineStatus: onlineStatus!,
      ),
    );
  }
}

import 'package:async_redux/async_redux.dart';
import 'package:prospect_app/application/core/utils/string_utils.dart';
import 'package:prospect_app/application/redux/states/app_state.dart';

class PersonAvatarCircleViewModel {
  PersonAvatarCircleViewModel({
    required this.initials,
  });

  String initials;

  static PersonAvatarCircleViewModel fromStore(Store<AppState> store) {
    return PersonAvatarCircleViewModel(
      initials: StringUtils.getInitials(
        store.state.userState!.profile!.fullName.value.getOrElse(() => ''),
      ),
    );
  }
}

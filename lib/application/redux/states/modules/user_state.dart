import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prospect_app/domain/entities/user_profile_entity.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/domain/objects/name_value_object.dart';
import 'package:prospect_app/domain/objects/phone_number_value_object.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
@JsonSerializable()
class UserState with _$UserState {
  factory UserState({
    UserProfile? profile,
    required UserOnlineStatus userOnlineStatus,
    required String? token,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial({
    UserProfile? userProfile,
  }) =>
      UserState(
        profile: UserProfile(
          fullName: FullName.withValue(input: ''),
          emailAddress: EmailAddress.withValue(input: ''),
          phoneNumber: PhoneNumber.withValue(input: ''),
          role: '',
        ),
        userOnlineStatus: UserOnlineStatus.AWAY,
        token: null,
      );
}

enum UserOnlineStatus {
  ONLINE,
  AWAY,
  OFFLINE,
}

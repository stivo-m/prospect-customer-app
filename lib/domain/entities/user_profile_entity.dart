import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prospect_app/domain/objects/email_value_object.dart';
import 'package:prospect_app/domain/objects/name_value_object.dart';
import 'package:prospect_app/domain/objects/phone_number_value_object.dart';

part 'user_profile_entity.freezed.dart';
part 'user_profile_entity.g.dart';

@freezed
@JsonSerializable()
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: 'name') required FullName fullName,
    @JsonKey(name: 'email') required EmailAddress emailAddress,
    @JsonKey(name: 'phone_number') required PhoneNumber phoneNumber,
    @JsonKey(name: 'role') required String role,
    // @JsonKey(name: 'status') required String status,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'name': instance.fullName,
      'email': instance.emailAddress,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
    };

_$_UserProfile _$_$_UserProfileFromJson(Map<String, dynamic> json) {
  return _$_UserProfile(
    fullName: FullName.fromJson(json['name'] as String),
    emailAddress: EmailAddress.fromJson(json['email'] as String),
    phoneNumber: PhoneNumber.fromJson(json['phone_number'] as String),
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$_$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'name': instance.fullName,
      'email': instance.emailAddress,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
    };

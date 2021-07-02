// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    profile: json['profile'] == null
        ? null
        : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
    userOnlineStatus:
        _$enumDecode(_$UserOnlineStatusEnumMap, json['userOnlineStatus']),
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'userOnlineStatus': _$UserOnlineStatusEnumMap[instance.userOnlineStatus],
      'token': instance.token,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$UserOnlineStatusEnumMap = {
  UserOnlineStatus.ONLINE: 'ONLINE',
  UserOnlineStatus.AWAY: 'AWAY',
  UserOnlineStatus.OFFLINE: 'OFFLINE',
};

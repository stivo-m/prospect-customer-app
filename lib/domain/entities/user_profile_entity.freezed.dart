// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _UserProfile call(
      {@JsonKey(name: 'name') required FullName fullName,
      @JsonKey(name: 'email') required EmailAddress emailAddress,
      @JsonKey(name: 'phone_number') required PhoneNumber phoneNumber,
      @JsonKey(name: 'role') required String role}) {
    return _UserProfile(
      fullName: fullName,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      role: role,
    );
  }

  UserProfile fromJson(Map<String, Object> json) {
    return UserProfile.fromJson(json);
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  @JsonKey(name: 'name')
  FullName get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'name') FullName fullName,
      @JsonKey(name: 'email') EmailAddress emailAddress,
      @JsonKey(name: 'phone_number') PhoneNumber phoneNumber,
      @JsonKey(name: 'role') String role});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) then) =
      __$UserProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'name') FullName fullName,
      @JsonKey(name: 'email') EmailAddress emailAddress,
      @JsonKey(name: 'phone_number') PhoneNumber phoneNumber,
      @JsonKey(name: 'role') String role});
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(
      _UserProfile _value, $Res Function(_UserProfile) _then)
      : super(_value, (v) => _then(v as _UserProfile));

  @override
  _UserProfile get _value => super._value as _UserProfile;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? emailAddress = freezed,
    Object? phoneNumber = freezed,
    Object? role = freezed,
  }) {
    return _then(_UserProfile(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile(
      {@JsonKey(name: 'name') required this.fullName,
      @JsonKey(name: 'email') required this.emailAddress,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      @JsonKey(name: 'role') required this.role});

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileFromJson(json);

  @override
  @JsonKey(name: 'name')
  final FullName fullName;
  @override
  @JsonKey(name: 'email')
  final EmailAddress emailAddress;
  @override
  @JsonKey(name: 'phone_number')
  final PhoneNumber phoneNumber;
  @override
  @JsonKey(name: 'role')
  final String role;

  @override
  String toString() {
    return 'UserProfile(fullName: $fullName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfile &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(role);

  @JsonKey(ignore: true)
  @override
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {@JsonKey(name: 'name') required FullName fullName,
      @JsonKey(name: 'email') required EmailAddress emailAddress,
      @JsonKey(name: 'phone_number') required PhoneNumber phoneNumber,
      @JsonKey(name: 'role') required String role}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  @JsonKey(name: 'name')
  FullName get fullName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'email')
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'phone_number')
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

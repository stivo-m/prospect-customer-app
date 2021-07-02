// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call({UserState? userState, BottomNavState? bottomNavState}) {
    return _AppState(
      userState: userState,
      bottomNavState: bottomNavState,
    );
  }

  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  UserState? get userState => throw _privateConstructorUsedError;
  BottomNavState? get bottomNavState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({UserState? userState, BottomNavState? bottomNavState});

  $UserStateCopyWith<$Res>? get userState;
  $BottomNavStateCopyWith<$Res>? get bottomNavState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? userState = freezed,
    Object? bottomNavState = freezed,
  }) {
    return _then(_value.copyWith(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      bottomNavState: bottomNavState == freezed
          ? _value.bottomNavState
          : bottomNavState // ignore: cast_nullable_to_non_nullable
              as BottomNavState?,
    ));
  }

  @override
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value));
    });
  }

  @override
  $BottomNavStateCopyWith<$Res>? get bottomNavState {
    if (_value.bottomNavState == null) {
      return null;
    }

    return $BottomNavStateCopyWith<$Res>(_value.bottomNavState!, (value) {
      return _then(_value.copyWith(bottomNavState: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call({UserState? userState, BottomNavState? bottomNavState});

  @override
  $UserStateCopyWith<$Res>? get userState;
  @override
  $BottomNavStateCopyWith<$Res>? get bottomNavState;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? userState = freezed,
    Object? bottomNavState = freezed,
  }) {
    return _then(_AppState(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      bottomNavState: bottomNavState == freezed
          ? _value.bottomNavState
          : bottomNavState // ignore: cast_nullable_to_non_nullable
              as BottomNavState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState({this.userState, this.bottomNavState});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final UserState? userState;
  @override
  final BottomNavState? bottomNavState;

  @override
  String toString() {
    return 'AppState(userState: $userState, bottomNavState: $bottomNavState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)) &&
            (identical(other.bottomNavState, bottomNavState) ||
                const DeepCollectionEquality()
                    .equals(other.bottomNavState, bottomNavState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userState) ^
      const DeepCollectionEquality().hash(bottomNavState);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  factory _AppState({UserState? userState, BottomNavState? bottomNavState}) =
      _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  UserState? get userState => throw _privateConstructorUsedError;
  @override
  BottomNavState? get bottomNavState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bottom_nav_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BottomNavState _$BottomNavStateFromJson(Map<String, dynamic> json) {
  return _BottomNavState.fromJson(json);
}

/// @nodoc
class _$BottomNavStateTearOff {
  const _$BottomNavStateTearOff();

  _BottomNavState call({int? currentIndex, List<dynamic>? navItems}) {
    return _BottomNavState(
      currentIndex: currentIndex,
      navItems: navItems,
    );
  }

  BottomNavState fromJson(Map<String, Object> json) {
    return BottomNavState.fromJson(json);
  }
}

/// @nodoc
const $BottomNavState = _$BottomNavStateTearOff();

/// @nodoc
mixin _$BottomNavState {
  int? get currentIndex => throw _privateConstructorUsedError;
  List<dynamic>? get navItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BottomNavStateCopyWith<BottomNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavStateCopyWith<$Res> {
  factory $BottomNavStateCopyWith(
          BottomNavState value, $Res Function(BottomNavState) then) =
      _$BottomNavStateCopyWithImpl<$Res>;
  $Res call({int? currentIndex, List<dynamic>? navItems});
}

/// @nodoc
class _$BottomNavStateCopyWithImpl<$Res>
    implements $BottomNavStateCopyWith<$Res> {
  _$BottomNavStateCopyWithImpl(this._value, this._then);

  final BottomNavState _value;
  // ignore: unused_field
  final $Res Function(BottomNavState) _then;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? navItems = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      navItems: navItems == freezed
          ? _value.navItems
          : navItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$BottomNavStateCopyWith<$Res>
    implements $BottomNavStateCopyWith<$Res> {
  factory _$BottomNavStateCopyWith(
          _BottomNavState value, $Res Function(_BottomNavState) then) =
      __$BottomNavStateCopyWithImpl<$Res>;
  @override
  $Res call({int? currentIndex, List<dynamic>? navItems});
}

/// @nodoc
class __$BottomNavStateCopyWithImpl<$Res>
    extends _$BottomNavStateCopyWithImpl<$Res>
    implements _$BottomNavStateCopyWith<$Res> {
  __$BottomNavStateCopyWithImpl(
      _BottomNavState _value, $Res Function(_BottomNavState) _then)
      : super(_value, (v) => _then(v as _BottomNavState));

  @override
  _BottomNavState get _value => super._value as _BottomNavState;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? navItems = freezed,
  }) {
    return _then(_BottomNavState(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      navItems: navItems == freezed
          ? _value.navItems
          : navItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BottomNavState implements _BottomNavState {
  _$_BottomNavState({this.currentIndex, this.navItems});

  factory _$_BottomNavState.fromJson(Map<String, dynamic> json) =>
      _$_$_BottomNavStateFromJson(json);

  @override
  final int? currentIndex;
  @override
  final List<dynamic>? navItems;

  @override
  String toString() {
    return 'BottomNavState(currentIndex: $currentIndex, navItems: $navItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BottomNavState &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)) &&
            (identical(other.navItems, navItems) ||
                const DeepCollectionEquality()
                    .equals(other.navItems, navItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentIndex) ^
      const DeepCollectionEquality().hash(navItems);

  @JsonKey(ignore: true)
  @override
  _$BottomNavStateCopyWith<_BottomNavState> get copyWith =>
      __$BottomNavStateCopyWithImpl<_BottomNavState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BottomNavStateToJson(this);
  }
}

abstract class _BottomNavState implements BottomNavState {
  factory _BottomNavState({int? currentIndex, List<dynamic>? navItems}) =
      _$_BottomNavState;

  factory _BottomNavState.fromJson(Map<String, dynamic> json) =
      _$_BottomNavState.fromJson;

  @override
  int? get currentIndex => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get navItems => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BottomNavStateCopyWith<_BottomNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

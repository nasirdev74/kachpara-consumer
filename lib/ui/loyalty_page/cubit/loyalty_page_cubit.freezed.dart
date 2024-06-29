// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoyaltyPageState {
  Store? get store => throw _privateConstructorUsedError;
  UserStore? get userStore => throw _privateConstructorUsedError;
  Status get getLoyaltyStatus => throw _privateConstructorUsedError;
  bool get showSnackbar => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoyaltyPageStateCopyWith<LoyaltyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyPageStateCopyWith<$Res> {
  factory $LoyaltyPageStateCopyWith(
          LoyaltyPageState value, $Res Function(LoyaltyPageState) then) =
      _$LoyaltyPageStateCopyWithImpl<$Res, LoyaltyPageState>;
  @useResult
  $Res call(
      {Store? store,
      UserStore? userStore,
      Status getLoyaltyStatus,
      bool showSnackbar,
      String? error});
}

/// @nodoc
class _$LoyaltyPageStateCopyWithImpl<$Res, $Val extends LoyaltyPageState>
    implements $LoyaltyPageStateCopyWith<$Res> {
  _$LoyaltyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
    Object? userStore = freezed,
    Object? getLoyaltyStatus = null,
    Object? showSnackbar = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      userStore: freezed == userStore
          ? _value.userStore
          : userStore // ignore: cast_nullable_to_non_nullable
              as UserStore?,
      getLoyaltyStatus: null == getLoyaltyStatus
          ? _value.getLoyaltyStatus
          : getLoyaltyStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      showSnackbar: null == showSnackbar
          ? _value.showSnackbar
          : showSnackbar // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyPageStateImplCopyWith<$Res>
    implements $LoyaltyPageStateCopyWith<$Res> {
  factory _$$LoyaltyPageStateImplCopyWith(_$LoyaltyPageStateImpl value,
          $Res Function(_$LoyaltyPageStateImpl) then) =
      __$$LoyaltyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Store? store,
      UserStore? userStore,
      Status getLoyaltyStatus,
      bool showSnackbar,
      String? error});
}

/// @nodoc
class __$$LoyaltyPageStateImplCopyWithImpl<$Res>
    extends _$LoyaltyPageStateCopyWithImpl<$Res, _$LoyaltyPageStateImpl>
    implements _$$LoyaltyPageStateImplCopyWith<$Res> {
  __$$LoyaltyPageStateImplCopyWithImpl(_$LoyaltyPageStateImpl _value,
      $Res Function(_$LoyaltyPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
    Object? userStore = freezed,
    Object? getLoyaltyStatus = null,
    Object? showSnackbar = null,
    Object? error = freezed,
  }) {
    return _then(_$LoyaltyPageStateImpl(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      userStore: freezed == userStore
          ? _value.userStore
          : userStore // ignore: cast_nullable_to_non_nullable
              as UserStore?,
      getLoyaltyStatus: null == getLoyaltyStatus
          ? _value.getLoyaltyStatus
          : getLoyaltyStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      showSnackbar: null == showSnackbar
          ? _value.showSnackbar
          : showSnackbar // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoyaltyPageStateImpl implements _LoyaltyPageState {
  const _$LoyaltyPageStateImpl(
      {this.store,
      this.userStore,
      this.getLoyaltyStatus = Status.init,
      this.showSnackbar = false,
      this.error});

  @override
  final Store? store;
  @override
  final UserStore? userStore;
  @override
  @JsonKey()
  final Status getLoyaltyStatus;
  @override
  @JsonKey()
  final bool showSnackbar;
  @override
  final String? error;

  @override
  String toString() {
    return 'LoyaltyPageState(store: $store, userStore: $userStore, getLoyaltyStatus: $getLoyaltyStatus, showSnackbar: $showSnackbar, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyPageStateImpl &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.userStore, userStore) ||
                other.userStore == userStore) &&
            (identical(other.getLoyaltyStatus, getLoyaltyStatus) ||
                other.getLoyaltyStatus == getLoyaltyStatus) &&
            (identical(other.showSnackbar, showSnackbar) ||
                other.showSnackbar == showSnackbar) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, store, userStore, getLoyaltyStatus, showSnackbar, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyPageStateImplCopyWith<_$LoyaltyPageStateImpl> get copyWith =>
      __$$LoyaltyPageStateImplCopyWithImpl<_$LoyaltyPageStateImpl>(
          this, _$identity);
}

abstract class _LoyaltyPageState implements LoyaltyPageState {
  const factory _LoyaltyPageState(
      {final Store? store,
      final UserStore? userStore,
      final Status getLoyaltyStatus,
      final bool showSnackbar,
      final String? error}) = _$LoyaltyPageStateImpl;

  @override
  Store? get store;
  @override
  UserStore? get userStore;
  @override
  Status get getLoyaltyStatus;
  @override
  bool get showSnackbar;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$LoyaltyPageStateImplCopyWith<_$LoyaltyPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

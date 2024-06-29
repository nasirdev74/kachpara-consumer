// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_details_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoreDetailsPageState {
  Status get status => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreDetailsPageStateCopyWith<StoreDetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailsPageStateCopyWith<$Res> {
  factory $StoreDetailsPageStateCopyWith(StoreDetailsPageState value,
          $Res Function(StoreDetailsPageState) then) =
      _$StoreDetailsPageStateCopyWithImpl<$Res, StoreDetailsPageState>;
  @useResult
  $Res call({Status status, Store? store});
}

/// @nodoc
class _$StoreDetailsPageStateCopyWithImpl<$Res,
        $Val extends StoreDetailsPageState>
    implements $StoreDetailsPageStateCopyWith<$Res> {
  _$StoreDetailsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $StoreDetailsPageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Store? store});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StoreDetailsPageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? store = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.status = Status.loading, this.store = null});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Store? store;

  @override
  String toString() {
    return 'StoreDetailsPageState(status: $status, store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements StoreDetailsPageState {
  const factory _Initial({final Status status, final Store? store}) =
      _$InitialImpl;

  @override
  Status get status;
  @override
  Store? get store;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

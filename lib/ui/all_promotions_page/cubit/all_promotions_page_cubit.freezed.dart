// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_promotions_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllPromotionsPageState {
  Status get getPromotionsStatus => throw _privateConstructorUsedError;
  Map<Store, List<Promotion>> get promotions =>
      throw _privateConstructorUsedError;
  String? get getPromotionsErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllPromotionsPageStateCopyWith<AllPromotionsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllPromotionsPageStateCopyWith<$Res> {
  factory $AllPromotionsPageStateCopyWith(AllPromotionsPageState value,
          $Res Function(AllPromotionsPageState) then) =
      _$AllPromotionsPageStateCopyWithImpl<$Res, AllPromotionsPageState>;
  @useResult
  $Res call(
      {Status getPromotionsStatus,
      Map<Store, List<Promotion>> promotions,
      String? getPromotionsErrorMessage});
}

/// @nodoc
class _$AllPromotionsPageStateCopyWithImpl<$Res,
        $Val extends AllPromotionsPageState>
    implements $AllPromotionsPageStateCopyWith<$Res> {
  _$AllPromotionsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPromotionsStatus = null,
    Object? promotions = null,
    Object? getPromotionsErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      getPromotionsStatus: null == getPromotionsStatus
          ? _value.getPromotionsStatus
          : getPromotionsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Map<Store, List<Promotion>>,
      getPromotionsErrorMessage: freezed == getPromotionsErrorMessage
          ? _value.getPromotionsErrorMessage
          : getPromotionsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllPromotionsPageStateImplCopyWith<$Res>
    implements $AllPromotionsPageStateCopyWith<$Res> {
  factory _$$AllPromotionsPageStateImplCopyWith(
          _$AllPromotionsPageStateImpl value,
          $Res Function(_$AllPromotionsPageStateImpl) then) =
      __$$AllPromotionsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status getPromotionsStatus,
      Map<Store, List<Promotion>> promotions,
      String? getPromotionsErrorMessage});
}

/// @nodoc
class __$$AllPromotionsPageStateImplCopyWithImpl<$Res>
    extends _$AllPromotionsPageStateCopyWithImpl<$Res,
        _$AllPromotionsPageStateImpl>
    implements _$$AllPromotionsPageStateImplCopyWith<$Res> {
  __$$AllPromotionsPageStateImplCopyWithImpl(
      _$AllPromotionsPageStateImpl _value,
      $Res Function(_$AllPromotionsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPromotionsStatus = null,
    Object? promotions = null,
    Object? getPromotionsErrorMessage = freezed,
  }) {
    return _then(_$AllPromotionsPageStateImpl(
      getPromotionsStatus: null == getPromotionsStatus
          ? _value.getPromotionsStatus
          : getPromotionsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      promotions: null == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Map<Store, List<Promotion>>,
      getPromotionsErrorMessage: freezed == getPromotionsErrorMessage
          ? _value.getPromotionsErrorMessage
          : getPromotionsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AllPromotionsPageStateImpl implements _AllPromotionsPageState {
  const _$AllPromotionsPageStateImpl(
      {this.getPromotionsStatus = Status.init,
      final Map<Store, List<Promotion>> promotions = const {},
      this.getPromotionsErrorMessage})
      : _promotions = promotions;

  @override
  @JsonKey()
  final Status getPromotionsStatus;
  final Map<Store, List<Promotion>> _promotions;
  @override
  @JsonKey()
  Map<Store, List<Promotion>> get promotions {
    if (_promotions is EqualUnmodifiableMapView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_promotions);
  }

  @override
  final String? getPromotionsErrorMessage;

  @override
  String toString() {
    return 'AllPromotionsPageState(getPromotionsStatus: $getPromotionsStatus, promotions: $promotions, getPromotionsErrorMessage: $getPromotionsErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllPromotionsPageStateImpl &&
            (identical(other.getPromotionsStatus, getPromotionsStatus) ||
                other.getPromotionsStatus == getPromotionsStatus) &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            (identical(other.getPromotionsErrorMessage,
                    getPromotionsErrorMessage) ||
                other.getPromotionsErrorMessage == getPromotionsErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getPromotionsStatus,
      const DeepCollectionEquality().hash(_promotions),
      getPromotionsErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllPromotionsPageStateImplCopyWith<_$AllPromotionsPageStateImpl>
      get copyWith => __$$AllPromotionsPageStateImplCopyWithImpl<
          _$AllPromotionsPageStateImpl>(this, _$identity);
}

abstract class _AllPromotionsPageState implements AllPromotionsPageState {
  const factory _AllPromotionsPageState(
      {final Status getPromotionsStatus,
      final Map<Store, List<Promotion>> promotions,
      final String? getPromotionsErrorMessage}) = _$AllPromotionsPageStateImpl;

  @override
  Status get getPromotionsStatus;
  @override
  Map<Store, List<Promotion>> get promotions;
  @override
  String? get getPromotionsErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AllPromotionsPageStateImplCopyWith<_$AllPromotionsPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

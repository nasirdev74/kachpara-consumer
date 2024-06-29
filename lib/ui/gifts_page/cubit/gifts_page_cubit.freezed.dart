// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gifts_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GiftsPageState {
  Status get giftsStatus => throw _privateConstructorUsedError;
  List<Gift> get gifts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GiftsPageStateCopyWith<GiftsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftsPageStateCopyWith<$Res> {
  factory $GiftsPageStateCopyWith(
          GiftsPageState value, $Res Function(GiftsPageState) then) =
      _$GiftsPageStateCopyWithImpl<$Res, GiftsPageState>;
  @useResult
  $Res call({Status giftsStatus, List<Gift> gifts});
}

/// @nodoc
class _$GiftsPageStateCopyWithImpl<$Res, $Val extends GiftsPageState>
    implements $GiftsPageStateCopyWith<$Res> {
  _$GiftsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftsStatus = null,
    Object? gifts = null,
  }) {
    return _then(_value.copyWith(
      giftsStatus: null == giftsStatus
          ? _value.giftsStatus
          : giftsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      gifts: null == gifts
          ? _value.gifts
          : gifts // ignore: cast_nullable_to_non_nullable
              as List<Gift>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftsPageStateImplCopyWith<$Res>
    implements $GiftsPageStateCopyWith<$Res> {
  factory _$$GiftsPageStateImplCopyWith(_$GiftsPageStateImpl value,
          $Res Function(_$GiftsPageStateImpl) then) =
      __$$GiftsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status giftsStatus, List<Gift> gifts});
}

/// @nodoc
class __$$GiftsPageStateImplCopyWithImpl<$Res>
    extends _$GiftsPageStateCopyWithImpl<$Res, _$GiftsPageStateImpl>
    implements _$$GiftsPageStateImplCopyWith<$Res> {
  __$$GiftsPageStateImplCopyWithImpl(
      _$GiftsPageStateImpl _value, $Res Function(_$GiftsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftsStatus = null,
    Object? gifts = null,
  }) {
    return _then(_$GiftsPageStateImpl(
      giftsStatus: null == giftsStatus
          ? _value.giftsStatus
          : giftsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      gifts: null == gifts
          ? _value._gifts
          : gifts // ignore: cast_nullable_to_non_nullable
              as List<Gift>,
    ));
  }
}

/// @nodoc

class _$GiftsPageStateImpl implements _GiftsPageState {
  const _$GiftsPageStateImpl(
      {this.giftsStatus = Status.init, final List<Gift> gifts = const []})
      : _gifts = gifts;

  @override
  @JsonKey()
  final Status giftsStatus;
  final List<Gift> _gifts;
  @override
  @JsonKey()
  List<Gift> get gifts {
    if (_gifts is EqualUnmodifiableListView) return _gifts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gifts);
  }

  @override
  String toString() {
    return 'GiftsPageState(giftsStatus: $giftsStatus, gifts: $gifts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftsPageStateImpl &&
            (identical(other.giftsStatus, giftsStatus) ||
                other.giftsStatus == giftsStatus) &&
            const DeepCollectionEquality().equals(other._gifts, _gifts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, giftsStatus, const DeepCollectionEquality().hash(_gifts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftsPageStateImplCopyWith<_$GiftsPageStateImpl> get copyWith =>
      __$$GiftsPageStateImplCopyWithImpl<_$GiftsPageStateImpl>(
          this, _$identity);
}

abstract class _GiftsPageState implements GiftsPageState {
  const factory _GiftsPageState(
      {final Status giftsStatus,
      final List<Gift> gifts}) = _$GiftsPageStateImpl;

  @override
  Status get giftsStatus;
  @override
  List<Gift> get gifts;
  @override
  @JsonKey(ignore: true)
  _$$GiftsPageStateImplCopyWith<_$GiftsPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

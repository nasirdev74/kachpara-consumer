// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curation_detail_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurationDetailPageState {
  Curation? get curation => throw _privateConstructorUsedError;
  Status get fetchCurationStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurationDetailPageStateCopyWith<CurationDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurationDetailPageStateCopyWith<$Res> {
  factory $CurationDetailPageStateCopyWith(CurationDetailPageState value,
          $Res Function(CurationDetailPageState) then) =
      _$CurationDetailPageStateCopyWithImpl<$Res, CurationDetailPageState>;
  @useResult
  $Res call({Curation? curation, Status fetchCurationStatus});
}

/// @nodoc
class _$CurationDetailPageStateCopyWithImpl<$Res,
        $Val extends CurationDetailPageState>
    implements $CurationDetailPageStateCopyWith<$Res> {
  _$CurationDetailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curation = freezed,
    Object? fetchCurationStatus = null,
  }) {
    return _then(_value.copyWith(
      curation: freezed == curation
          ? _value.curation
          : curation // ignore: cast_nullable_to_non_nullable
              as Curation?,
      fetchCurationStatus: null == fetchCurationStatus
          ? _value.fetchCurationStatus
          : fetchCurationStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurationDetailPageStateImplCopyWith<$Res>
    implements $CurationDetailPageStateCopyWith<$Res> {
  factory _$$CurationDetailPageStateImplCopyWith(
          _$CurationDetailPageStateImpl value,
          $Res Function(_$CurationDetailPageStateImpl) then) =
      __$$CurationDetailPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Curation? curation, Status fetchCurationStatus});
}

/// @nodoc
class __$$CurationDetailPageStateImplCopyWithImpl<$Res>
    extends _$CurationDetailPageStateCopyWithImpl<$Res,
        _$CurationDetailPageStateImpl>
    implements _$$CurationDetailPageStateImplCopyWith<$Res> {
  __$$CurationDetailPageStateImplCopyWithImpl(
      _$CurationDetailPageStateImpl _value,
      $Res Function(_$CurationDetailPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curation = freezed,
    Object? fetchCurationStatus = null,
  }) {
    return _then(_$CurationDetailPageStateImpl(
      curation: freezed == curation
          ? _value.curation
          : curation // ignore: cast_nullable_to_non_nullable
              as Curation?,
      fetchCurationStatus: null == fetchCurationStatus
          ? _value.fetchCurationStatus
          : fetchCurationStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CurationDetailPageStateImpl implements _CurationDetailPageState {
  const _$CurationDetailPageStateImpl(
      {this.curation, this.fetchCurationStatus = Status.init});

  @override
  final Curation? curation;
  @override
  @JsonKey()
  final Status fetchCurationStatus;

  @override
  String toString() {
    return 'CurationDetailPageState(curation: $curation, fetchCurationStatus: $fetchCurationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurationDetailPageStateImpl &&
            (identical(other.curation, curation) ||
                other.curation == curation) &&
            (identical(other.fetchCurationStatus, fetchCurationStatus) ||
                other.fetchCurationStatus == fetchCurationStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curation, fetchCurationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurationDetailPageStateImplCopyWith<_$CurationDetailPageStateImpl>
      get copyWith => __$$CurationDetailPageStateImplCopyWithImpl<
          _$CurationDetailPageStateImpl>(this, _$identity);
}

abstract class _CurationDetailPageState implements CurationDetailPageState {
  const factory _CurationDetailPageState(
      {final Curation? curation,
      final Status fetchCurationStatus}) = _$CurationDetailPageStateImpl;

  @override
  Curation? get curation;
  @override
  Status get fetchCurationStatus;
  @override
  @JsonKey(ignore: true)
  _$$CurationDetailPageStateImplCopyWith<_$CurationDetailPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

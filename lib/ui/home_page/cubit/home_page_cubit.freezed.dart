// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  List<Curation> get curations => throw _privateConstructorUsedError;
  Status get curationsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call({List<Curation> curations, Status curationsStatus});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curations = null,
    Object? curationsStatus = null,
  }) {
    return _then(_value.copyWith(
      curations: null == curations
          ? _value.curations
          : curations // ignore: cast_nullable_to_non_nullable
              as List<Curation>,
      curationsStatus: null == curationsStatus
          ? _value.curationsStatus
          : curationsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Curation> curations, Status curationsStatus});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curations = null,
    Object? curationsStatus = null,
  }) {
    return _then(_$HomePageStateImpl(
      curations: null == curations
          ? _value._curations
          : curations // ignore: cast_nullable_to_non_nullable
              as List<Curation>,
      curationsStatus: null == curationsStatus
          ? _value.curationsStatus
          : curationsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl implements _HomePageState {
  const _$HomePageStateImpl(
      {final List<Curation> curations = const <Curation>[],
      this.curationsStatus = Status.init})
      : _curations = curations;

  final List<Curation> _curations;
  @override
  @JsonKey()
  List<Curation> get curations {
    if (_curations is EqualUnmodifiableListView) return _curations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_curations);
  }

  @override
  @JsonKey()
  final Status curationsStatus;

  @override
  String toString() {
    return 'HomePageState(curations: $curations, curationsStatus: $curationsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._curations, _curations) &&
            (identical(other.curationsStatus, curationsStatus) ||
                other.curationsStatus == curationsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_curations), curationsStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final List<Curation> curations,
      final Status curationsStatus}) = _$HomePageStateImpl;

  @override
  List<Curation> get curations;
  @override
  Status get curationsStatus;
  @override
  @JsonKey(ignore: true)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompetitionPageState {
  Competition? get competition => throw _privateConstructorUsedError;
  Map<String, String>? get userNames =>
      throw _privateConstructorUsedError; // Add this line
  Status get fetchCompetitionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompetitionPageStateCopyWith<CompetitionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompetitionPageStateCopyWith<$Res> {
  factory $CompetitionPageStateCopyWith(CompetitionPageState value,
          $Res Function(CompetitionPageState) then) =
      _$CompetitionPageStateCopyWithImpl<$Res, CompetitionPageState>;
  @useResult
  $Res call(
      {Competition? competition,
      Map<String, String>? userNames,
      Status fetchCompetitionStatus});
}

/// @nodoc
class _$CompetitionPageStateCopyWithImpl<$Res,
        $Val extends CompetitionPageState>
    implements $CompetitionPageStateCopyWith<$Res> {
  _$CompetitionPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? competition = freezed,
    Object? userNames = freezed,
    Object? fetchCompetitionStatus = null,
  }) {
    return _then(_value.copyWith(
      competition: freezed == competition
          ? _value.competition
          : competition // ignore: cast_nullable_to_non_nullable
              as Competition?,
      userNames: freezed == userNames
          ? _value.userNames
          : userNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      fetchCompetitionStatus: null == fetchCompetitionStatus
          ? _value.fetchCompetitionStatus
          : fetchCompetitionStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompetitionPageStateImplCopyWith<$Res>
    implements $CompetitionPageStateCopyWith<$Res> {
  factory _$$CompetitionPageStateImplCopyWith(_$CompetitionPageStateImpl value,
          $Res Function(_$CompetitionPageStateImpl) then) =
      __$$CompetitionPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Competition? competition,
      Map<String, String>? userNames,
      Status fetchCompetitionStatus});
}

/// @nodoc
class __$$CompetitionPageStateImplCopyWithImpl<$Res>
    extends _$CompetitionPageStateCopyWithImpl<$Res, _$CompetitionPageStateImpl>
    implements _$$CompetitionPageStateImplCopyWith<$Res> {
  __$$CompetitionPageStateImplCopyWithImpl(_$CompetitionPageStateImpl _value,
      $Res Function(_$CompetitionPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? competition = freezed,
    Object? userNames = freezed,
    Object? fetchCompetitionStatus = null,
  }) {
    return _then(_$CompetitionPageStateImpl(
      competition: freezed == competition
          ? _value.competition
          : competition // ignore: cast_nullable_to_non_nullable
              as Competition?,
      userNames: freezed == userNames
          ? _value._userNames
          : userNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      fetchCompetitionStatus: null == fetchCompetitionStatus
          ? _value.fetchCompetitionStatus
          : fetchCompetitionStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CompetitionPageStateImpl implements _CompetitionPageState {
  const _$CompetitionPageStateImpl(
      {this.competition,
      final Map<String, String>? userNames,
      this.fetchCompetitionStatus = Status.init})
      : _userNames = userNames;

  @override
  final Competition? competition;
  final Map<String, String>? _userNames;
  @override
  Map<String, String>? get userNames {
    final value = _userNames;
    if (value == null) return null;
    if (_userNames is EqualUnmodifiableMapView) return _userNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// Add this line
  @override
  @JsonKey()
  final Status fetchCompetitionStatus;

  @override
  String toString() {
    return 'CompetitionPageState(competition: $competition, userNames: $userNames, fetchCompetitionStatus: $fetchCompetitionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompetitionPageStateImpl &&
            (identical(other.competition, competition) ||
                other.competition == competition) &&
            const DeepCollectionEquality()
                .equals(other._userNames, _userNames) &&
            (identical(other.fetchCompetitionStatus, fetchCompetitionStatus) ||
                other.fetchCompetitionStatus == fetchCompetitionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, competition,
      const DeepCollectionEquality().hash(_userNames), fetchCompetitionStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompetitionPageStateImplCopyWith<_$CompetitionPageStateImpl>
      get copyWith =>
          __$$CompetitionPageStateImplCopyWithImpl<_$CompetitionPageStateImpl>(
              this, _$identity);
}

abstract class _CompetitionPageState implements CompetitionPageState {
  const factory _CompetitionPageState(
      {final Competition? competition,
      final Map<String, String>? userNames,
      final Status fetchCompetitionStatus}) = _$CompetitionPageStateImpl;

  @override
  Competition? get competition;
  @override
  Map<String, String>? get userNames;
  @override // Add this line
  Status get fetchCompetitionStatus;
  @override
  @JsonKey(ignore: true)
  _$$CompetitionPageStateImplCopyWith<_$CompetitionPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

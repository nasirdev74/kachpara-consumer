// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurationBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurations,
    required TResult Function(Curation curation) added,
    required TResult Function(Curation curation) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurations,
    TResult? Function(Curation curation)? added,
    TResult? Function(Curation curation)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurations,
    TResult Function(Curation curation)? added,
    TResult Function(Curation curation)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCurations value) getCurations,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCurations value)? getCurations,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCurations value)? getCurations,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurationBlocEventCopyWith<$Res> {
  factory $CurationBlocEventCopyWith(
          CurationBlocEvent value, $Res Function(CurationBlocEvent) then) =
      _$CurationBlocEventCopyWithImpl<$Res, CurationBlocEvent>;
}

/// @nodoc
class _$CurationBlocEventCopyWithImpl<$Res, $Val extends CurationBlocEvent>
    implements $CurationBlocEventCopyWith<$Res> {
  _$CurationBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCurationsImplCopyWith<$Res> {
  factory _$$GetCurationsImplCopyWith(
          _$GetCurationsImpl value, $Res Function(_$GetCurationsImpl) then) =
      __$$GetCurationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCurationsImplCopyWithImpl<$Res>
    extends _$CurationBlocEventCopyWithImpl<$Res, _$GetCurationsImpl>
    implements _$$GetCurationsImplCopyWith<$Res> {
  __$$GetCurationsImplCopyWithImpl(
      _$GetCurationsImpl _value, $Res Function(_$GetCurationsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCurationsImpl with DiagnosticableTreeMixin implements _GetCurations {
  const _$GetCurationsImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CurationBlocEvent.getCurations()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'CurationBlocEvent.getCurations'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCurationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurations,
    required TResult Function(Curation curation) added,
    required TResult Function(Curation curation) deleted,
  }) {
    return getCurations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurations,
    TResult? Function(Curation curation)? added,
    TResult? Function(Curation curation)? deleted,
  }) {
    return getCurations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurations,
    TResult Function(Curation curation)? added,
    TResult Function(Curation curation)? deleted,
    required TResult orElse(),
  }) {
    if (getCurations != null) {
      return getCurations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCurations value) getCurations,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
  }) {
    return getCurations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCurations value)? getCurations,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return getCurations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCurations value)? getCurations,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (getCurations != null) {
      return getCurations(this);
    }
    return orElse();
  }
}

abstract class _GetCurations implements CurationBlocEvent {
  const factory _GetCurations() = _$GetCurationsImpl;
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Curation curation});
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$CurationBlocEventCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curation = null,
  }) {
    return _then(_$AddedImpl(
      curation: null == curation
          ? _value.curation
          : curation // ignore: cast_nullable_to_non_nullable
              as Curation,
    ));
  }
}

/// @nodoc

class _$AddedImpl with DiagnosticableTreeMixin implements _Added {
  const _$AddedImpl({required this.curation});

  @override
  final Curation curation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CurationBlocEvent.added(curation: $curation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CurationBlocEvent.added'))
      ..add(DiagnosticsProperty('curation', curation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedImpl &&
            (identical(other.curation, curation) ||
                other.curation == curation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedImplCopyWith<_$AddedImpl> get copyWith =>
      __$$AddedImplCopyWithImpl<_$AddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurations,
    required TResult Function(Curation curation) added,
    required TResult Function(Curation curation) deleted,
  }) {
    return added(curation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurations,
    TResult? Function(Curation curation)? added,
    TResult? Function(Curation curation)? deleted,
  }) {
    return added?.call(curation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurations,
    TResult Function(Curation curation)? added,
    TResult Function(Curation curation)? deleted,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(curation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCurations value) getCurations,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCurations value)? getCurations,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCurations value)? getCurations,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added implements CurationBlocEvent {
  const factory _Added({required final Curation curation}) = _$AddedImpl;

  Curation get curation;
  @JsonKey(ignore: true)
  _$$AddedImplCopyWith<_$AddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Curation curation});
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$CurationBlocEventCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curation = null,
  }) {
    return _then(_$DeletedImpl(
      curation: null == curation
          ? _value.curation
          : curation // ignore: cast_nullable_to_non_nullable
              as Curation,
    ));
  }
}

/// @nodoc

class _$DeletedImpl with DiagnosticableTreeMixin implements _Deleted {
  const _$DeletedImpl({required this.curation});

  @override
  final Curation curation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CurationBlocEvent.deleted(curation: $curation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CurationBlocEvent.deleted'))
      ..add(DiagnosticsProperty('curation', curation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletedImpl &&
            (identical(other.curation, curation) ||
                other.curation == curation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      __$$DeletedImplCopyWithImpl<_$DeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurations,
    required TResult Function(Curation curation) added,
    required TResult Function(Curation curation) deleted,
  }) {
    return deleted(curation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurations,
    TResult? Function(Curation curation)? added,
    TResult? Function(Curation curation)? deleted,
  }) {
    return deleted?.call(curation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurations,
    TResult Function(Curation curation)? added,
    TResult Function(Curation curation)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(curation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCurations value) getCurations,
    required TResult Function(_Added value) added,
    required TResult Function(_Deleted value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCurations value)? getCurations,
    TResult? Function(_Added value)? added,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCurations value)? getCurations,
    TResult Function(_Added value)? added,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements CurationBlocEvent {
  const factory _Deleted({required final Curation curation}) = _$DeletedImpl;

  Curation get curation;
  @JsonKey(ignore: true)
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurationBlocState {
  List<Curation> get curations => throw _privateConstructorUsedError;
  Status get getCurationsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurationBlocStateCopyWith<CurationBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurationBlocStateCopyWith<$Res> {
  factory $CurationBlocStateCopyWith(
          CurationBlocState value, $Res Function(CurationBlocState) then) =
      _$CurationBlocStateCopyWithImpl<$Res, CurationBlocState>;
  @useResult
  $Res call({List<Curation> curations, Status getCurationsStatus});
}

/// @nodoc
class _$CurationBlocStateCopyWithImpl<$Res, $Val extends CurationBlocState>
    implements $CurationBlocStateCopyWith<$Res> {
  _$CurationBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curations = null,
    Object? getCurationsStatus = null,
  }) {
    return _then(_value.copyWith(
      curations: null == curations
          ? _value.curations
          : curations // ignore: cast_nullable_to_non_nullable
              as List<Curation>,
      getCurationsStatus: null == getCurationsStatus
          ? _value.getCurationsStatus
          : getCurationsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurationBlocStateImplCopyWith<$Res>
    implements $CurationBlocStateCopyWith<$Res> {
  factory _$$CurationBlocStateImplCopyWith(_$CurationBlocStateImpl value,
          $Res Function(_$CurationBlocStateImpl) then) =
      __$$CurationBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Curation> curations, Status getCurationsStatus});
}

/// @nodoc
class __$$CurationBlocStateImplCopyWithImpl<$Res>
    extends _$CurationBlocStateCopyWithImpl<$Res, _$CurationBlocStateImpl>
    implements _$$CurationBlocStateImplCopyWith<$Res> {
  __$$CurationBlocStateImplCopyWithImpl(_$CurationBlocStateImpl _value,
      $Res Function(_$CurationBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curations = null,
    Object? getCurationsStatus = null,
  }) {
    return _then(_$CurationBlocStateImpl(
      curations: null == curations
          ? _value._curations
          : curations // ignore: cast_nullable_to_non_nullable
              as List<Curation>,
      getCurationsStatus: null == getCurationsStatus
          ? _value.getCurationsStatus
          : getCurationsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CurationBlocStateImpl
    with DiagnosticableTreeMixin
    implements _CurationBlocState {
  const _$CurationBlocStateImpl(
      {final List<Curation> curations = const <Curation>[],
      this.getCurationsStatus = Status.init})
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
  final Status getCurationsStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CurationBlocState(curations: $curations, getCurationsStatus: $getCurationsStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CurationBlocState'))
      ..add(DiagnosticsProperty('curations', curations))
      ..add(DiagnosticsProperty('getCurationsStatus', getCurationsStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurationBlocStateImpl &&
            const DeepCollectionEquality()
                .equals(other._curations, _curations) &&
            (identical(other.getCurationsStatus, getCurationsStatus) ||
                other.getCurationsStatus == getCurationsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_curations), getCurationsStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurationBlocStateImplCopyWith<_$CurationBlocStateImpl> get copyWith =>
      __$$CurationBlocStateImplCopyWithImpl<_$CurationBlocStateImpl>(
          this, _$identity);
}

abstract class _CurationBlocState implements CurationBlocState {
  const factory _CurationBlocState(
      {final List<Curation> curations,
      final Status getCurationsStatus}) = _$CurationBlocStateImpl;

  @override
  List<Curation> get curations;
  @override
  Status get getCurationsStatus;
  @override
  @JsonKey(ignore: true)
  _$$CurationBlocStateImplCopyWith<_$CurationBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

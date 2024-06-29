// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_code_entry_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReferralCodeEntryPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() add,
    required TResult Function(String referralCode) entry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? add,
    TResult? Function(String referralCode)? entry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? add,
    TResult Function(String referralCode)? entry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Entry value) entry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Entry value)? entry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Entry value)? entry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeEntryPageEventCopyWith<$Res> {
  factory $ReferralCodeEntryPageEventCopyWith(ReferralCodeEntryPageEvent value,
          $Res Function(ReferralCodeEntryPageEvent) then) =
      _$ReferralCodeEntryPageEventCopyWithImpl<$Res,
          ReferralCodeEntryPageEvent>;
}

/// @nodoc
class _$ReferralCodeEntryPageEventCopyWithImpl<$Res,
        $Val extends ReferralCodeEntryPageEvent>
    implements $ReferralCodeEntryPageEventCopyWith<$Res> {
  _$ReferralCodeEntryPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$ReferralCodeEntryPageEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddImpl with DiagnosticableTreeMixin implements _Add {
  const _$AddImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReferralCodeEntryPageEvent.add()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ReferralCodeEntryPageEvent.add'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() add,
    required TResult Function(String referralCode) entry,
  }) {
    return add();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? add,
    TResult? Function(String referralCode)? entry,
  }) {
    return add?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? add,
    TResult Function(String referralCode)? entry,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Entry value) entry,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Entry value)? entry,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Entry value)? entry,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements ReferralCodeEntryPageEvent {
  const factory _Add() = _$AddImpl;
}

/// @nodoc
abstract class _$$EntryImplCopyWith<$Res> {
  factory _$$EntryImplCopyWith(
          _$EntryImpl value, $Res Function(_$EntryImpl) then) =
      __$$EntryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String referralCode});
}

/// @nodoc
class __$$EntryImplCopyWithImpl<$Res>
    extends _$ReferralCodeEntryPageEventCopyWithImpl<$Res, _$EntryImpl>
    implements _$$EntryImplCopyWith<$Res> {
  __$$EntryImplCopyWithImpl(
      _$EntryImpl _value, $Res Function(_$EntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
  }) {
    return _then(_$EntryImpl(
      null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EntryImpl with DiagnosticableTreeMixin implements _Entry {
  const _$EntryImpl(this.referralCode);

  @override
  final String referralCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReferralCodeEntryPageEvent.entry(referralCode: $referralCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReferralCodeEntryPageEvent.entry'))
      ..add(DiagnosticsProperty('referralCode', referralCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referralCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      __$$EntryImplCopyWithImpl<_$EntryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() add,
    required TResult Function(String referralCode) entry,
  }) {
    return entry(referralCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? add,
    TResult? Function(String referralCode)? entry,
  }) {
    return entry?.call(referralCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? add,
    TResult Function(String referralCode)? entry,
    required TResult orElse(),
  }) {
    if (entry != null) {
      return entry(referralCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Entry value) entry,
  }) {
    return entry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Entry value)? entry,
  }) {
    return entry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Entry value)? entry,
    required TResult orElse(),
  }) {
    if (entry != null) {
      return entry(this);
    }
    return orElse();
  }
}

abstract class _Entry implements ReferralCodeEntryPageEvent {
  const factory _Entry(final String referralCode) = _$EntryImpl;

  String get referralCode;
  @JsonKey(ignore: true)
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReferralCodeEntryPageState {
  Status get addStatus => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  Curation? get curation => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  String? get referredBy => throw _privateConstructorUsedError;
  Status get entryStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReferralCodeEntryPageStateCopyWith<ReferralCodeEntryPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeEntryPageStateCopyWith<$Res> {
  factory $ReferralCodeEntryPageStateCopyWith(ReferralCodeEntryPageState value,
          $Res Function(ReferralCodeEntryPageState) then) =
      _$ReferralCodeEntryPageStateCopyWithImpl<$Res,
          ReferralCodeEntryPageState>;
  @useResult
  $Res call(
      {Status addStatus,
      Store? store,
      Curation? curation,
      String? errorMessage,
      String? referralCode,
      String? referredBy,
      Status entryStatus});
}

/// @nodoc
class _$ReferralCodeEntryPageStateCopyWithImpl<$Res,
        $Val extends ReferralCodeEntryPageState>
    implements $ReferralCodeEntryPageStateCopyWith<$Res> {
  _$ReferralCodeEntryPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStatus = null,
    Object? store = freezed,
    Object? curation = freezed,
    Object? errorMessage = freezed,
    Object? referralCode = freezed,
    Object? referredBy = freezed,
    Object? entryStatus = null,
  }) {
    return _then(_value.copyWith(
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      curation: freezed == curation
          ? _value.curation
          : curation // ignore: cast_nullable_to_non_nullable
              as Curation?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      entryStatus: null == entryStatus
          ? _value.entryStatus
          : entryStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralCodeEntryPageStateImplCopyWith<$Res>
    implements $ReferralCodeEntryPageStateCopyWith<$Res> {
  factory _$$ReferralCodeEntryPageStateImplCopyWith(
          _$ReferralCodeEntryPageStateImpl value,
          $Res Function(_$ReferralCodeEntryPageStateImpl) then) =
      __$$ReferralCodeEntryPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status addStatus,
      Store? store,
      Curation? curation,
      String? errorMessage,
      String? referralCode,
      String? referredBy,
      Status entryStatus});
}

/// @nodoc
class __$$ReferralCodeEntryPageStateImplCopyWithImpl<$Res>
    extends _$ReferralCodeEntryPageStateCopyWithImpl<$Res,
        _$ReferralCodeEntryPageStateImpl>
    implements _$$ReferralCodeEntryPageStateImplCopyWith<$Res> {
  __$$ReferralCodeEntryPageStateImplCopyWithImpl(
      _$ReferralCodeEntryPageStateImpl _value,
      $Res Function(_$ReferralCodeEntryPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addStatus = null,
    Object? store = freezed,
    Object? curation = freezed,
    Object? errorMessage = freezed,
    Object? referralCode = freezed,
    Object? referredBy = freezed,
    Object? entryStatus = null,
  }) {
    return _then(_$ReferralCodeEntryPageStateImpl(
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      curation: freezed == curation
          ? _value.curation
          : curation // ignore: cast_nullable_to_non_nullable
              as Curation?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      entryStatus: null == entryStatus
          ? _value.entryStatus
          : entryStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$ReferralCodeEntryPageStateImpl
    with DiagnosticableTreeMixin
    implements _ReferralCodeEntryPageState {
  const _$ReferralCodeEntryPageStateImpl(
      {this.addStatus = Status.init,
      this.store,
      this.curation,
      this.errorMessage,
      this.referralCode,
      this.referredBy,
      this.entryStatus = Status.init});

  @override
  @JsonKey()
  final Status addStatus;
  @override
  final Store? store;
  @override
  final Curation? curation;
  @override
  final String? errorMessage;
  @override
  final String? referralCode;
  @override
  final String? referredBy;
  @override
  @JsonKey()
  final Status entryStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReferralCodeEntryPageState(addStatus: $addStatus, store: $store, curation: $curation, errorMessage: $errorMessage, referralCode: $referralCode, referredBy: $referredBy, entryStatus: $entryStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReferralCodeEntryPageState'))
      ..add(DiagnosticsProperty('addStatus', addStatus))
      ..add(DiagnosticsProperty('store', store))
      ..add(DiagnosticsProperty('curation', curation))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('referralCode', referralCode))
      ..add(DiagnosticsProperty('referredBy', referredBy))
      ..add(DiagnosticsProperty('entryStatus', entryStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralCodeEntryPageStateImpl &&
            (identical(other.addStatus, addStatus) ||
                other.addStatus == addStatus) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.curation, curation) ||
                other.curation == curation) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.entryStatus, entryStatus) ||
                other.entryStatus == entryStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addStatus, store, curation,
      errorMessage, referralCode, referredBy, entryStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralCodeEntryPageStateImplCopyWith<_$ReferralCodeEntryPageStateImpl>
      get copyWith => __$$ReferralCodeEntryPageStateImplCopyWithImpl<
          _$ReferralCodeEntryPageStateImpl>(this, _$identity);
}

abstract class _ReferralCodeEntryPageState
    implements ReferralCodeEntryPageState {
  const factory _ReferralCodeEntryPageState(
      {final Status addStatus,
      final Store? store,
      final Curation? curation,
      final String? errorMessage,
      final String? referralCode,
      final String? referredBy,
      final Status entryStatus}) = _$ReferralCodeEntryPageStateImpl;

  @override
  Status get addStatus;
  @override
  Store? get store;
  @override
  Curation? get curation;
  @override
  String? get errorMessage;
  @override
  String? get referralCode;
  @override
  String? get referredBy;
  @override
  Status get entryStatus;
  @override
  @JsonKey(ignore: true)
  _$$ReferralCodeEntryPageStateImplCopyWith<_$ReferralCodeEntryPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

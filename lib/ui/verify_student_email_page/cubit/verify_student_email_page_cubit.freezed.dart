// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_student_email_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyStudentEmailPageState {
  Status get verificationStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyStudentEmailPageStateCopyWith<VerifyStudentEmailPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyStudentEmailPageStateCopyWith<$Res> {
  factory $VerifyStudentEmailPageStateCopyWith(
          VerifyStudentEmailPageState value,
          $Res Function(VerifyStudentEmailPageState) then) =
      _$VerifyStudentEmailPageStateCopyWithImpl<$Res,
          VerifyStudentEmailPageState>;
  @useResult
  $Res call({Status verificationStatus});
}

/// @nodoc
class _$VerifyStudentEmailPageStateCopyWithImpl<$Res,
        $Val extends VerifyStudentEmailPageState>
    implements $VerifyStudentEmailPageStateCopyWith<$Res> {
  _$VerifyStudentEmailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationStatus = null,
  }) {
    return _then(_value.copyWith(
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyStudentEmailPageStateImplCopyWith<$Res>
    implements $VerifyStudentEmailPageStateCopyWith<$Res> {
  factory _$$VerifyStudentEmailPageStateImplCopyWith(
          _$VerifyStudentEmailPageStateImpl value,
          $Res Function(_$VerifyStudentEmailPageStateImpl) then) =
      __$$VerifyStudentEmailPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status verificationStatus});
}

/// @nodoc
class __$$VerifyStudentEmailPageStateImplCopyWithImpl<$Res>
    extends _$VerifyStudentEmailPageStateCopyWithImpl<$Res,
        _$VerifyStudentEmailPageStateImpl>
    implements _$$VerifyStudentEmailPageStateImplCopyWith<$Res> {
  __$$VerifyStudentEmailPageStateImplCopyWithImpl(
      _$VerifyStudentEmailPageStateImpl _value,
      $Res Function(_$VerifyStudentEmailPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationStatus = null,
  }) {
    return _then(_$VerifyStudentEmailPageStateImpl(
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$VerifyStudentEmailPageStateImpl
    implements _VerifyStudentEmailPageState {
  const _$VerifyStudentEmailPageStateImpl(
      {this.verificationStatus = Status.init});

  @override
  @JsonKey()
  final Status verificationStatus;

  @override
  String toString() {
    return 'VerifyStudentEmailPageState(verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyStudentEmailPageStateImpl &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyStudentEmailPageStateImplCopyWith<_$VerifyStudentEmailPageStateImpl>
      get copyWith => __$$VerifyStudentEmailPageStateImplCopyWithImpl<
          _$VerifyStudentEmailPageStateImpl>(this, _$identity);
}

abstract class _VerifyStudentEmailPageState
    implements VerifyStudentEmailPageState {
  const factory _VerifyStudentEmailPageState(
      {final Status verificationStatus}) = _$VerifyStudentEmailPageStateImpl;

  @override
  Status get verificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$VerifyStudentEmailPageStateImplCopyWith<_$VerifyStudentEmailPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

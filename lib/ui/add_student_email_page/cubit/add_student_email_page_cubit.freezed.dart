// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_student_email_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddStudentEmailPageState {
  Status get sendingEmailStatus => throw _privateConstructorUsedError;
  String? get getErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStudentEmailPageStateCopyWith<AddStudentEmailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStudentEmailPageStateCopyWith<$Res> {
  factory $AddStudentEmailPageStateCopyWith(AddStudentEmailPageState value,
          $Res Function(AddStudentEmailPageState) then) =
      _$AddStudentEmailPageStateCopyWithImpl<$Res, AddStudentEmailPageState>;
  @useResult
  $Res call({Status sendingEmailStatus, String? getErrorMessage});
}

/// @nodoc
class _$AddStudentEmailPageStateCopyWithImpl<$Res,
        $Val extends AddStudentEmailPageState>
    implements $AddStudentEmailPageStateCopyWith<$Res> {
  _$AddStudentEmailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendingEmailStatus = null,
    Object? getErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      sendingEmailStatus: null == sendingEmailStatus
          ? _value.sendingEmailStatus
          : sendingEmailStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      getErrorMessage: freezed == getErrorMessage
          ? _value.getErrorMessage
          : getErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStudentEmailPageStateImplCopyWith<$Res>
    implements $AddStudentEmailPageStateCopyWith<$Res> {
  factory _$$AddStudentEmailPageStateImplCopyWith(
          _$AddStudentEmailPageStateImpl value,
          $Res Function(_$AddStudentEmailPageStateImpl) then) =
      __$$AddStudentEmailPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status sendingEmailStatus, String? getErrorMessage});
}

/// @nodoc
class __$$AddStudentEmailPageStateImplCopyWithImpl<$Res>
    extends _$AddStudentEmailPageStateCopyWithImpl<$Res,
        _$AddStudentEmailPageStateImpl>
    implements _$$AddStudentEmailPageStateImplCopyWith<$Res> {
  __$$AddStudentEmailPageStateImplCopyWithImpl(
      _$AddStudentEmailPageStateImpl _value,
      $Res Function(_$AddStudentEmailPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendingEmailStatus = null,
    Object? getErrorMessage = freezed,
  }) {
    return _then(_$AddStudentEmailPageStateImpl(
      sendingEmailStatus: null == sendingEmailStatus
          ? _value.sendingEmailStatus
          : sendingEmailStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      getErrorMessage: freezed == getErrorMessage
          ? _value.getErrorMessage
          : getErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddStudentEmailPageStateImpl implements _AddStudentEmailPageState {
  const _$AddStudentEmailPageStateImpl(
      {this.sendingEmailStatus = Status.init, this.getErrorMessage});

  @override
  @JsonKey()
  final Status sendingEmailStatus;
  @override
  final String? getErrorMessage;

  @override
  String toString() {
    return 'AddStudentEmailPageState(sendingEmailStatus: $sendingEmailStatus, getErrorMessage: $getErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStudentEmailPageStateImpl &&
            (identical(other.sendingEmailStatus, sendingEmailStatus) ||
                other.sendingEmailStatus == sendingEmailStatus) &&
            (identical(other.getErrorMessage, getErrorMessage) ||
                other.getErrorMessage == getErrorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sendingEmailStatus, getErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStudentEmailPageStateImplCopyWith<_$AddStudentEmailPageStateImpl>
      get copyWith => __$$AddStudentEmailPageStateImplCopyWithImpl<
          _$AddStudentEmailPageStateImpl>(this, _$identity);
}

abstract class _AddStudentEmailPageState implements AddStudentEmailPageState {
  const factory _AddStudentEmailPageState(
      {final Status sendingEmailStatus,
      final String? getErrorMessage}) = _$AddStudentEmailPageStateImpl;

  @override
  Status get sendingEmailStatus;
  @override
  String? get getErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AddStudentEmailPageStateImplCopyWith<_$AddStudentEmailPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

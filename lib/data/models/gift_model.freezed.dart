// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GiftModel _$GiftModelFromJson(Map<String, dynamic> json) {
  return _GiftModel.fromJson(json);
}

/// @nodoc
mixin _$GiftModel {
  String get type => throw _privateConstructorUsedError;
  String? get senderUserId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  String? get giftDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftModelCopyWith<GiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftModelCopyWith<$Res> {
  factory $GiftModelCopyWith(GiftModel value, $Res Function(GiftModel) then) =
      _$GiftModelCopyWithImpl<$Res, GiftModel>;
  @useResult
  $Res call(
      {String type,
      String? senderUserId,
      String orderId,
      String status,
      String? senderName,
      String? giftDescription});
}

/// @nodoc
class _$GiftModelCopyWithImpl<$Res, $Val extends GiftModel>
    implements $GiftModelCopyWith<$Res> {
  _$GiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? senderUserId = freezed,
    Object? orderId = null,
    Object? status = null,
    Object? senderName = freezed,
    Object? giftDescription = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      senderUserId: freezed == senderUserId
          ? _value.senderUserId
          : senderUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      giftDescription: freezed == giftDescription
          ? _value.giftDescription
          : giftDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftModelImplCopyWith<$Res>
    implements $GiftModelCopyWith<$Res> {
  factory _$$GiftModelImplCopyWith(
          _$GiftModelImpl value, $Res Function(_$GiftModelImpl) then) =
      __$$GiftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String? senderUserId,
      String orderId,
      String status,
      String? senderName,
      String? giftDescription});
}

/// @nodoc
class __$$GiftModelImplCopyWithImpl<$Res>
    extends _$GiftModelCopyWithImpl<$Res, _$GiftModelImpl>
    implements _$$GiftModelImplCopyWith<$Res> {
  __$$GiftModelImplCopyWithImpl(
      _$GiftModelImpl _value, $Res Function(_$GiftModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? senderUserId = freezed,
    Object? orderId = null,
    Object? status = null,
    Object? senderName = freezed,
    Object? giftDescription = freezed,
  }) {
    return _then(_$GiftModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      senderUserId: freezed == senderUserId
          ? _value.senderUserId
          : senderUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      giftDescription: freezed == giftDescription
          ? _value.giftDescription
          : giftDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftModelImpl extends _GiftModel {
  _$GiftModelImpl(
      {required this.type,
      this.senderUserId,
      required this.orderId,
      required this.status,
      this.senderName,
      this.giftDescription})
      : super._();

  factory _$GiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftModelImplFromJson(json);

  @override
  final String type;
  @override
  final String? senderUserId;
  @override
  final String orderId;
  @override
  final String status;
  @override
  final String? senderName;
  @override
  final String? giftDescription;

  @override
  String toString() {
    return 'GiftModel(type: $type, senderUserId: $senderUserId, orderId: $orderId, status: $status, senderName: $senderName, giftDescription: $giftDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.senderUserId, senderUserId) ||
                other.senderUserId == senderUserId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.giftDescription, giftDescription) ||
                other.giftDescription == giftDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, senderUserId, orderId,
      status, senderName, giftDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftModelImplCopyWith<_$GiftModelImpl> get copyWith =>
      __$$GiftModelImplCopyWithImpl<_$GiftModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftModelImplToJson(
      this,
    );
  }
}

abstract class _GiftModel extends GiftModel {
  factory _GiftModel(
      {required final String type,
      final String? senderUserId,
      required final String orderId,
      required final String status,
      final String? senderName,
      final String? giftDescription}) = _$GiftModelImpl;
  _GiftModel._() : super._();

  factory _GiftModel.fromJson(Map<String, dynamic> json) =
      _$GiftModelImpl.fromJson;

  @override
  String get type;
  @override
  String? get senderUserId;
  @override
  String get orderId;
  @override
  String get status;
  @override
  String? get senderName;
  @override
  String? get giftDescription;
  @override
  @JsonKey(ignore: true)
  _$$GiftModelImplCopyWith<_$GiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get phoneNo => throw _privateConstructorUsedError;
  String? get selectedAddressId => throw _privateConstructorUsedError;
  String? get selectedPaymentMethodId => throw _privateConstructorUsedError;
  String? get studentEmail => throw _privateConstructorUsedError;
  List<String>? get contactUserIds => throw _privateConstructorUsedError;
  bool? get isStudentVerified => throw _privateConstructorUsedError;
  double get rewardPoints => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  int get totalRefOrders => throw _privateConstructorUsedError;
  int get totalRefStores => throw _privateConstructorUsedError;
  int? get cartCount => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? photoUrl,
      String? phoneNo,
      String? selectedAddressId,
      String? selectedPaymentMethodId,
      String? studentEmail,
      List<String>? contactUserIds,
      bool? isStudentVerified,
      double rewardPoints,
      double balance,
      int totalRefOrders,
      int totalRefStores,
      int? cartCount,
      bool isAdmin});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? phoneNo = freezed,
    Object? selectedAddressId = freezed,
    Object? selectedPaymentMethodId = freezed,
    Object? studentEmail = freezed,
    Object? contactUserIds = freezed,
    Object? isStudentVerified = freezed,
    Object? rewardPoints = null,
    Object? balance = null,
    Object? totalRefOrders = null,
    Object? totalRefStores = null,
    Object? cartCount = freezed,
    Object? isAdmin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAddressId: freezed == selectedAddressId
          ? _value.selectedAddressId
          : selectedAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPaymentMethodId: freezed == selectedPaymentMethodId
          ? _value.selectedPaymentMethodId
          : selectedPaymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentEmail: freezed == studentEmail
          ? _value.studentEmail
          : studentEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactUserIds: freezed == contactUserIds
          ? _value.contactUserIds
          : contactUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isStudentVerified: freezed == isStudentVerified
          ? _value.isStudentVerified
          : isStudentVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      rewardPoints: null == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalRefOrders: null == totalRefOrders
          ? _value.totalRefOrders
          : totalRefOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRefStores: null == totalRefStores
          ? _value.totalRefStores
          : totalRefStores // ignore: cast_nullable_to_non_nullable
              as int,
      cartCount: freezed == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? photoUrl,
      String? phoneNo,
      String? selectedAddressId,
      String? selectedPaymentMethodId,
      String? studentEmail,
      List<String>? contactUserIds,
      bool? isStudentVerified,
      double rewardPoints,
      double balance,
      int totalRefOrders,
      int totalRefStores,
      int? cartCount,
      bool isAdmin});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? phoneNo = freezed,
    Object? selectedAddressId = freezed,
    Object? selectedPaymentMethodId = freezed,
    Object? studentEmail = freezed,
    Object? contactUserIds = freezed,
    Object? isStudentVerified = freezed,
    Object? rewardPoints = null,
    Object? balance = null,
    Object? totalRefOrders = null,
    Object? totalRefStores = null,
    Object? cartCount = freezed,
    Object? isAdmin = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAddressId: freezed == selectedAddressId
          ? _value.selectedAddressId
          : selectedAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPaymentMethodId: freezed == selectedPaymentMethodId
          ? _value.selectedPaymentMethodId
          : selectedPaymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      studentEmail: freezed == studentEmail
          ? _value.studentEmail
          : studentEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactUserIds: freezed == contactUserIds
          ? _value._contactUserIds
          : contactUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isStudentVerified: freezed == isStudentVerified
          ? _value.isStudentVerified
          : isStudentVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      rewardPoints: null == rewardPoints
          ? _value.rewardPoints
          : rewardPoints // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalRefOrders: null == totalRefOrders
          ? _value.totalRefOrders
          : totalRefOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRefStores: null == totalRefStores
          ? _value.totalRefStores
          : totalRefStores // ignore: cast_nullable_to_non_nullable
              as int,
      cartCount: freezed == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      this.name,
      this.photoUrl,
      this.phoneNo,
      this.selectedAddressId,
      this.selectedPaymentMethodId,
      this.studentEmail,
      final List<String>? contactUserIds,
      this.isStudentVerified = false,
      this.rewardPoints = 0,
      this.balance = 0,
      this.totalRefOrders = 0,
      this.totalRefStores = 0,
      this.cartCount = 0,
      this.isAdmin = false})
      : _contactUserIds = contactUserIds,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? photoUrl;
  @override
  final String? phoneNo;
  @override
  final String? selectedAddressId;
  @override
  final String? selectedPaymentMethodId;
  @override
  final String? studentEmail;
  final List<String>? _contactUserIds;
  @override
  List<String>? get contactUserIds {
    final value = _contactUserIds;
    if (value == null) return null;
    if (_contactUserIds is EqualUnmodifiableListView) return _contactUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool? isStudentVerified;
  @override
  @JsonKey()
  final double rewardPoints;
  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey()
  final int totalRefOrders;
  @override
  @JsonKey()
  final int totalRefStores;
  @override
  @JsonKey()
  final int? cartCount;
  @override
  @JsonKey()
  final bool isAdmin;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, photoUrl: $photoUrl, phoneNo: $phoneNo, selectedAddressId: $selectedAddressId, selectedPaymentMethodId: $selectedPaymentMethodId, studentEmail: $studentEmail, contactUserIds: $contactUserIds, isStudentVerified: $isStudentVerified, rewardPoints: $rewardPoints, balance: $balance, totalRefOrders: $totalRefOrders, totalRefStores: $totalRefStores, cartCount: $cartCount, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.selectedAddressId, selectedAddressId) ||
                other.selectedAddressId == selectedAddressId) &&
            (identical(
                    other.selectedPaymentMethodId, selectedPaymentMethodId) ||
                other.selectedPaymentMethodId == selectedPaymentMethodId) &&
            (identical(other.studentEmail, studentEmail) ||
                other.studentEmail == studentEmail) &&
            const DeepCollectionEquality()
                .equals(other._contactUserIds, _contactUserIds) &&
            (identical(other.isStudentVerified, isStudentVerified) ||
                other.isStudentVerified == isStudentVerified) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.totalRefOrders, totalRefOrders) ||
                other.totalRefOrders == totalRefOrders) &&
            (identical(other.totalRefStores, totalRefStores) ||
                other.totalRefStores == totalRefStores) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      photoUrl,
      phoneNo,
      selectedAddressId,
      selectedPaymentMethodId,
      studentEmail,
      const DeepCollectionEquality().hash(_contactUserIds),
      isStudentVerified,
      rewardPoints,
      balance,
      totalRefOrders,
      totalRefStores,
      cartCount,
      isAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final String id,
      final String? name,
      final String? photoUrl,
      final String? phoneNo,
      final String? selectedAddressId,
      final String? selectedPaymentMethodId,
      final String? studentEmail,
      final List<String>? contactUserIds,
      final bool? isStudentVerified,
      final double rewardPoints,
      final double balance,
      final int totalRefOrders,
      final int totalRefStores,
      final int? cartCount,
      final bool isAdmin}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get photoUrl;
  @override
  String? get phoneNo;
  @override
  String? get selectedAddressId;
  @override
  String? get selectedPaymentMethodId;
  @override
  String? get studentEmail;
  @override
  List<String>? get contactUserIds;
  @override
  bool? get isStudentVerified;
  @override
  double get rewardPoints;
  @override
  double get balance;
  @override
  int get totalRefOrders;
  @override
  int get totalRefStores;
  @override
  int? get cartCount;
  @override
  bool get isAdmin;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

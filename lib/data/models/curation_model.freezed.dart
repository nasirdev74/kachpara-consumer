// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurationModel _$CurationModelFromJson(Map<String, dynamic> json) {
  return _Curation.fromJson(json);
}

/// @nodoc
mixin _$CurationModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ownerUserId => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  String? get curatorName => throw _privateConstructorUsedError;
  String? get domain => throw _privateConstructorUsedError;
  List<String>? get stores => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageFileName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurationModelCopyWith<CurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurationModelCopyWith<$Res> {
  factory $CurationModelCopyWith(
          CurationModel value, $Res Function(CurationModel) then) =
      _$CurationModelCopyWithImpl<$Res, CurationModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerUserId,
      String referralCode,
      String? curatorName,
      String? domain,
      List<String>? stores,
      String? description,
      String? imageFileName});
}

/// @nodoc
class _$CurationModelCopyWithImpl<$Res, $Val extends CurationModel>
    implements $CurationModelCopyWith<$Res> {
  _$CurationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerUserId = null,
    Object? referralCode = null,
    Object? curatorName = freezed,
    Object? domain = freezed,
    Object? stores = freezed,
    Object? description = freezed,
    Object? imageFileName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      curatorName: freezed == curatorName
          ? _value.curatorName
          : curatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      stores: freezed == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFileName: freezed == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurationImplCopyWith<$Res>
    implements $CurationModelCopyWith<$Res> {
  factory _$$CurationImplCopyWith(
          _$CurationImpl value, $Res Function(_$CurationImpl) then) =
      __$$CurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerUserId,
      String referralCode,
      String? curatorName,
      String? domain,
      List<String>? stores,
      String? description,
      String? imageFileName});
}

/// @nodoc
class __$$CurationImplCopyWithImpl<$Res>
    extends _$CurationModelCopyWithImpl<$Res, _$CurationImpl>
    implements _$$CurationImplCopyWith<$Res> {
  __$$CurationImplCopyWithImpl(
      _$CurationImpl _value, $Res Function(_$CurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerUserId = null,
    Object? referralCode = null,
    Object? curatorName = freezed,
    Object? domain = freezed,
    Object? stores = freezed,
    Object? description = freezed,
    Object? imageFileName = freezed,
  }) {
    return _then(_$CurationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      curatorName: freezed == curatorName
          ? _value.curatorName
          : curatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      stores: freezed == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFileName: freezed == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurationImpl extends _Curation {
  _$CurationImpl(
      {required this.id,
      required this.name,
      required this.ownerUserId,
      required this.referralCode,
      this.curatorName,
      this.domain,
      final List<String>? stores,
      this.description,
      this.imageFileName})
      : _stores = stores,
        super._();

  factory _$CurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String ownerUserId;
  @override
  final String referralCode;
  @override
  final String? curatorName;
  @override
  final String? domain;
  final List<String>? _stores;
  @override
  List<String>? get stores {
    final value = _stores;
    if (value == null) return null;
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final String? imageFileName;

  @override
  String toString() {
    return 'CurationModel(id: $id, name: $name, ownerUserId: $ownerUserId, referralCode: $referralCode, curatorName: $curatorName, domain: $domain, stores: $stores, description: $description, imageFileName: $imageFileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.curatorName, curatorName) ||
                other.curatorName == curatorName) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ownerUserId,
      referralCode,
      curatorName,
      domain,
      const DeepCollectionEquality().hash(_stores),
      description,
      imageFileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurationImplCopyWith<_$CurationImpl> get copyWith =>
      __$$CurationImplCopyWithImpl<_$CurationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurationImplToJson(
      this,
    );
  }
}

abstract class _Curation extends CurationModel {
  factory _Curation(
      {required final String id,
      required final String name,
      required final String ownerUserId,
      required final String referralCode,
      final String? curatorName,
      final String? domain,
      final List<String>? stores,
      final String? description,
      final String? imageFileName}) = _$CurationImpl;
  _Curation._() : super._();

  factory _Curation.fromJson(Map<String, dynamic> json) =
      _$CurationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get ownerUserId;
  @override
  String get referralCode;
  @override
  String? get curatorName;
  @override
  String? get domain;
  @override
  List<String>? get stores;
  @override
  String? get description;
  @override
  String? get imageFileName;
  @override
  @JsonKey(ignore: true)
  _$$CurationImplCopyWith<_$CurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

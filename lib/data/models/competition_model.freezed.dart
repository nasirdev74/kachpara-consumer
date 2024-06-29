// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompetitionModel _$CompetitionModelFromJson(Map<String, dynamic> json) {
  return _CompetitionModel.fromJson(json);
}

/// @nodoc
mixin _$CompetitionModel {
  String get prize => throw _privateConstructorUsedError;
  Map<String, num> get outreach => throw _privateConstructorUsedError;
  Map<String, num> get directreach => throw _privateConstructorUsedError;
  Map<String, num> get orders => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompetitionModelCopyWith<CompetitionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompetitionModelCopyWith<$Res> {
  factory $CompetitionModelCopyWith(
          CompetitionModel value, $Res Function(CompetitionModel) then) =
      _$CompetitionModelCopyWithImpl<$Res, CompetitionModel>;
  @useResult
  $Res call(
      {String prize,
      Map<String, num> outreach,
      Map<String, num> directreach,
      Map<String, num> orders,
      @DateTimeConverter() DateTime? startDate,
      @DateTimeConverter() DateTime? endDate});
}

/// @nodoc
class _$CompetitionModelCopyWithImpl<$Res, $Val extends CompetitionModel>
    implements $CompetitionModelCopyWith<$Res> {
  _$CompetitionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prize = null,
    Object? outreach = null,
    Object? directreach = null,
    Object? orders = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      prize: null == prize
          ? _value.prize
          : prize // ignore: cast_nullable_to_non_nullable
              as String,
      outreach: null == outreach
          ? _value.outreach
          : outreach // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      directreach: null == directreach
          ? _value.directreach
          : directreach // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompetitionModelImplCopyWith<$Res>
    implements $CompetitionModelCopyWith<$Res> {
  factory _$$CompetitionModelImplCopyWith(_$CompetitionModelImpl value,
          $Res Function(_$CompetitionModelImpl) then) =
      __$$CompetitionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prize,
      Map<String, num> outreach,
      Map<String, num> directreach,
      Map<String, num> orders,
      @DateTimeConverter() DateTime? startDate,
      @DateTimeConverter() DateTime? endDate});
}

/// @nodoc
class __$$CompetitionModelImplCopyWithImpl<$Res>
    extends _$CompetitionModelCopyWithImpl<$Res, _$CompetitionModelImpl>
    implements _$$CompetitionModelImplCopyWith<$Res> {
  __$$CompetitionModelImplCopyWithImpl(_$CompetitionModelImpl _value,
      $Res Function(_$CompetitionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prize = null,
    Object? outreach = null,
    Object? directreach = null,
    Object? orders = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$CompetitionModelImpl(
      prize: null == prize
          ? _value.prize
          : prize // ignore: cast_nullable_to_non_nullable
              as String,
      outreach: null == outreach
          ? _value._outreach
          : outreach // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      directreach: null == directreach
          ? _value._directreach
          : directreach // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompetitionModelImpl extends _CompetitionModel {
  _$CompetitionModelImpl(
      {required this.prize,
      required final Map<String, num> outreach,
      required final Map<String, num> directreach,
      required final Map<String, num> orders,
      @DateTimeConverter() this.startDate,
      @DateTimeConverter() this.endDate})
      : _outreach = outreach,
        _directreach = directreach,
        _orders = orders,
        super._();

  factory _$CompetitionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompetitionModelImplFromJson(json);

  @override
  final String prize;
  final Map<String, num> _outreach;
  @override
  Map<String, num> get outreach {
    if (_outreach is EqualUnmodifiableMapView) return _outreach;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_outreach);
  }

  final Map<String, num> _directreach;
  @override
  Map<String, num> get directreach {
    if (_directreach is EqualUnmodifiableMapView) return _directreach;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_directreach);
  }

  final Map<String, num> _orders;
  @override
  Map<String, num> get orders {
    if (_orders is EqualUnmodifiableMapView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orders);
  }

  @override
  @DateTimeConverter()
  final DateTime? startDate;
  @override
  @DateTimeConverter()
  final DateTime? endDate;

  @override
  String toString() {
    return 'CompetitionModel(prize: $prize, outreach: $outreach, directreach: $directreach, orders: $orders, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompetitionModelImpl &&
            (identical(other.prize, prize) || other.prize == prize) &&
            const DeepCollectionEquality().equals(other._outreach, _outreach) &&
            const DeepCollectionEquality()
                .equals(other._directreach, _directreach) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      prize,
      const DeepCollectionEquality().hash(_outreach),
      const DeepCollectionEquality().hash(_directreach),
      const DeepCollectionEquality().hash(_orders),
      startDate,
      endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompetitionModelImplCopyWith<_$CompetitionModelImpl> get copyWith =>
      __$$CompetitionModelImplCopyWithImpl<_$CompetitionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompetitionModelImplToJson(
      this,
    );
  }
}

abstract class _CompetitionModel extends CompetitionModel {
  factory _CompetitionModel(
      {required final String prize,
      required final Map<String, num> outreach,
      required final Map<String, num> directreach,
      required final Map<String, num> orders,
      @DateTimeConverter() final DateTime? startDate,
      @DateTimeConverter() final DateTime? endDate}) = _$CompetitionModelImpl;
  _CompetitionModel._() : super._();

  factory _CompetitionModel.fromJson(Map<String, dynamic> json) =
      _$CompetitionModelImpl.fromJson;

  @override
  String get prize;
  @override
  Map<String, num> get outreach;
  @override
  Map<String, num> get directreach;
  @override
  Map<String, num> get orders;
  @override
  @DateTimeConverter()
  DateTime? get startDate;
  @override
  @DateTimeConverter()
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$CompetitionModelImplCopyWith<_$CompetitionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

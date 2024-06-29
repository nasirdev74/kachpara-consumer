// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_list_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressListPageState {
  Status get getAddressesStatus => throw _privateConstructorUsedError;
  List<Address> get addresses => throw _privateConstructorUsedError;
  String? get getAddressesErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressListPageStateCopyWith<AddressListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressListPageStateCopyWith<$Res> {
  factory $AddressListPageStateCopyWith(AddressListPageState value,
          $Res Function(AddressListPageState) then) =
      _$AddressListPageStateCopyWithImpl<$Res, AddressListPageState>;
  @useResult
  $Res call(
      {Status getAddressesStatus,
      List<Address> addresses,
      String? getAddressesErrorMessage});
}

/// @nodoc
class _$AddressListPageStateCopyWithImpl<$Res,
        $Val extends AddressListPageState>
    implements $AddressListPageStateCopyWith<$Res> {
  _$AddressListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAddressesStatus = null,
    Object? addresses = null,
    Object? getAddressesErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      getAddressesStatus: null == getAddressesStatus
          ? _value.getAddressesStatus
          : getAddressesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      getAddressesErrorMessage: freezed == getAddressesErrorMessage
          ? _value.getAddressesErrorMessage
          : getAddressesErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressListPageStateImplCopyWith<$Res>
    implements $AddressListPageStateCopyWith<$Res> {
  factory _$$AddressListPageStateImplCopyWith(_$AddressListPageStateImpl value,
          $Res Function(_$AddressListPageStateImpl) then) =
      __$$AddressListPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status getAddressesStatus,
      List<Address> addresses,
      String? getAddressesErrorMessage});
}

/// @nodoc
class __$$AddressListPageStateImplCopyWithImpl<$Res>
    extends _$AddressListPageStateCopyWithImpl<$Res, _$AddressListPageStateImpl>
    implements _$$AddressListPageStateImplCopyWith<$Res> {
  __$$AddressListPageStateImplCopyWithImpl(_$AddressListPageStateImpl _value,
      $Res Function(_$AddressListPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAddressesStatus = null,
    Object? addresses = null,
    Object? getAddressesErrorMessage = freezed,
  }) {
    return _then(_$AddressListPageStateImpl(
      getAddressesStatus: null == getAddressesStatus
          ? _value.getAddressesStatus
          : getAddressesStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      getAddressesErrorMessage: freezed == getAddressesErrorMessage
          ? _value.getAddressesErrorMessage
          : getAddressesErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddressListPageStateImpl implements _AddressListPageState {
  const _$AddressListPageStateImpl(
      {this.getAddressesStatus = Status.init,
      final List<Address> addresses = const [],
      this.getAddressesErrorMessage})
      : _addresses = addresses;

  @override
  @JsonKey()
  final Status getAddressesStatus;
  final List<Address> _addresses;
  @override
  @JsonKey()
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  final String? getAddressesErrorMessage;

  @override
  String toString() {
    return 'AddressListPageState(getAddressesStatus: $getAddressesStatus, addresses: $addresses, getAddressesErrorMessage: $getAddressesErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressListPageStateImpl &&
            (identical(other.getAddressesStatus, getAddressesStatus) ||
                other.getAddressesStatus == getAddressesStatus) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(
                    other.getAddressesErrorMessage, getAddressesErrorMessage) ||
                other.getAddressesErrorMessage == getAddressesErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getAddressesStatus,
      const DeepCollectionEquality().hash(_addresses),
      getAddressesErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressListPageStateImplCopyWith<_$AddressListPageStateImpl>
      get copyWith =>
          __$$AddressListPageStateImplCopyWithImpl<_$AddressListPageStateImpl>(
              this, _$identity);
}

abstract class _AddressListPageState implements AddressListPageState {
  const factory _AddressListPageState(
      {final Status getAddressesStatus,
      final List<Address> addresses,
      final String? getAddressesErrorMessage}) = _$AddressListPageStateImpl;

  @override
  Status get getAddressesStatus;
  @override
  List<Address> get addresses;
  @override
  String? get getAddressesErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AddressListPageStateImplCopyWith<_$AddressListPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

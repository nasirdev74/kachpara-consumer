// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactsPageState {
  List<Contact>? get contacts => throw _privateConstructorUsedError;
  Status get fetchContactsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactsPageStateCopyWith<ContactsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsPageStateCopyWith<$Res> {
  factory $ContactsPageStateCopyWith(
          ContactsPageState value, $Res Function(ContactsPageState) then) =
      _$ContactsPageStateCopyWithImpl<$Res, ContactsPageState>;
  @useResult
  $Res call({List<Contact>? contacts, Status fetchContactsStatus});
}

/// @nodoc
class _$ContactsPageStateCopyWithImpl<$Res, $Val extends ContactsPageState>
    implements $ContactsPageStateCopyWith<$Res> {
  _$ContactsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = freezed,
    Object? fetchContactsStatus = null,
  }) {
    return _then(_value.copyWith(
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      fetchContactsStatus: null == fetchContactsStatus
          ? _value.fetchContactsStatus
          : fetchContactsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactsPageStateImplCopyWith<$Res>
    implements $ContactsPageStateCopyWith<$Res> {
  factory _$$ContactsPageStateImplCopyWith(_$ContactsPageStateImpl value,
          $Res Function(_$ContactsPageStateImpl) then) =
      __$$ContactsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Contact>? contacts, Status fetchContactsStatus});
}

/// @nodoc
class __$$ContactsPageStateImplCopyWithImpl<$Res>
    extends _$ContactsPageStateCopyWithImpl<$Res, _$ContactsPageStateImpl>
    implements _$$ContactsPageStateImplCopyWith<$Res> {
  __$$ContactsPageStateImplCopyWithImpl(_$ContactsPageStateImpl _value,
      $Res Function(_$ContactsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = freezed,
    Object? fetchContactsStatus = null,
  }) {
    return _then(_$ContactsPageStateImpl(
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      fetchContactsStatus: null == fetchContactsStatus
          ? _value.fetchContactsStatus
          : fetchContactsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$ContactsPageStateImpl implements _ContactsPageState {
  const _$ContactsPageStateImpl(
      {final List<Contact>? contacts, this.fetchContactsStatus = Status.init})
      : _contacts = contacts;

  final List<Contact>? _contacts;
  @override
  List<Contact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Status fetchContactsStatus;

  @override
  String toString() {
    return 'ContactsPageState(contacts: $contacts, fetchContactsStatus: $fetchContactsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactsPageStateImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.fetchContactsStatus, fetchContactsStatus) ||
                other.fetchContactsStatus == fetchContactsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contacts), fetchContactsStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactsPageStateImplCopyWith<_$ContactsPageStateImpl> get copyWith =>
      __$$ContactsPageStateImplCopyWithImpl<_$ContactsPageStateImpl>(
          this, _$identity);
}

abstract class _ContactsPageState implements ContactsPageState {
  const factory _ContactsPageState(
      {final List<Contact>? contacts,
      final Status fetchContactsStatus}) = _$ContactsPageStateImpl;

  @override
  List<Contact>? get contacts;
  @override
  Status get fetchContactsStatus;
  @override
  @JsonKey(ignore: true)
  _$$ContactsPageStateImplCopyWith<_$ContactsPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

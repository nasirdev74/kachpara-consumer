// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FeedPageState {
  List<FeedItem> get feeds => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedPageStateCopyWith<FeedPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPageStateCopyWith<$Res> {
  factory $FeedPageStateCopyWith(
          FeedPageState value, $Res Function(FeedPageState) then) =
      _$FeedPageStateCopyWithImpl<$Res, FeedPageState>;
  @useResult
  $Res call({List<FeedItem> feeds, bool hasReachedEnd, Status status});
}

/// @nodoc
class _$FeedPageStateCopyWithImpl<$Res, $Val extends FeedPageState>
    implements $FeedPageStateCopyWith<$Res> {
  _$FeedPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeds = null,
    Object? hasReachedEnd = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      feeds: null == feeds
          ? _value.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedPageStateImplCopyWith<$Res>
    implements $FeedPageStateCopyWith<$Res> {
  factory _$$FeedPageStateImplCopyWith(
          _$FeedPageStateImpl value, $Res Function(_$FeedPageStateImpl) then) =
      __$$FeedPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FeedItem> feeds, bool hasReachedEnd, Status status});
}

/// @nodoc
class __$$FeedPageStateImplCopyWithImpl<$Res>
    extends _$FeedPageStateCopyWithImpl<$Res, _$FeedPageStateImpl>
    implements _$$FeedPageStateImplCopyWith<$Res> {
  __$$FeedPageStateImplCopyWithImpl(
      _$FeedPageStateImpl _value, $Res Function(_$FeedPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeds = null,
    Object? hasReachedEnd = null,
    Object? status = null,
  }) {
    return _then(_$FeedPageStateImpl(
      feeds: null == feeds
          ? _value._feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<FeedItem>,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$FeedPageStateImpl implements _FeedPageState {
  const _$FeedPageStateImpl(
      {final List<FeedItem> feeds = const [],
      this.hasReachedEnd = false,
      this.status = Status.init})
      : _feeds = feeds;

  final List<FeedItem> _feeds;
  @override
  @JsonKey()
  List<FeedItem> get feeds {
    if (_feeds is EqualUnmodifiableListView) return _feeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feeds);
  }

  @override
  @JsonKey()
  final bool hasReachedEnd;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'FeedPageState(feeds: $feeds, hasReachedEnd: $hasReachedEnd, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPageStateImpl &&
            const DeepCollectionEquality().equals(other._feeds, _feeds) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_feeds), hasReachedEnd, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPageStateImplCopyWith<_$FeedPageStateImpl> get copyWith =>
      __$$FeedPageStateImplCopyWithImpl<_$FeedPageStateImpl>(this, _$identity);
}

abstract class _FeedPageState implements FeedPageState {
  const factory _FeedPageState(
      {final List<FeedItem> feeds,
      final bool hasReachedEnd,
      final Status status}) = _$FeedPageStateImpl;

  @override
  List<FeedItem> get feeds;
  @override
  bool get hasReachedEnd;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$FeedPageStateImplCopyWith<_$FeedPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

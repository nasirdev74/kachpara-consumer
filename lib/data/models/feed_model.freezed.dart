// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) {
  return _FeedModel.fromJson(json);
}

/// @nodoc
mixin _$FeedModel {
  bool? get postedByStore => throw _privateConstructorUsedError;
  String? get storeName => throw _privateConstructorUsedError;
  String? get sender => throw _privateConstructorUsedError;
  String? get reciever => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  List<String>? get contentUrl => throw _privateConstructorUsedError;
  FeedType get feedType => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get posterId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get timeStamp => throw _privateConstructorUsedError;
  List<ActionType> get actionType => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  List<String> get audienceIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedModelCopyWith<FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedModelCopyWith<$Res> {
  factory $FeedModelCopyWith(FeedModel value, $Res Function(FeedModel) then) =
      _$FeedModelCopyWithImpl<$Res, FeedModel>;
  @useResult
  $Res call(
      {bool? postedByStore,
      String? storeName,
      String? sender,
      String? reciever,
      String? orderId,
      List<String>? contentUrl,
      FeedType feedType,
      UserType userType,
      String storeId,
      String id,
      String posterId,
      String content,
      String timeStamp,
      List<ActionType> actionType,
      String ownerId,
      List<String> audienceIds});
}

/// @nodoc
class _$FeedModelCopyWithImpl<$Res, $Val extends FeedModel>
    implements $FeedModelCopyWith<$Res> {
  _$FeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postedByStore = freezed,
    Object? storeName = freezed,
    Object? sender = freezed,
    Object? reciever = freezed,
    Object? orderId = freezed,
    Object? contentUrl = freezed,
    Object? feedType = null,
    Object? userType = null,
    Object? storeId = null,
    Object? id = null,
    Object? posterId = null,
    Object? content = null,
    Object? timeStamp = null,
    Object? actionType = null,
    Object? ownerId = null,
    Object? audienceIds = null,
  }) {
    return _then(_value.copyWith(
      postedByStore: freezed == postedByStore
          ? _value.postedByStore
          : postedByStore // ignore: cast_nullable_to_non_nullable
              as bool?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      reciever: freezed == reciever
          ? _value.reciever
          : reciever // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentUrl: freezed == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      feedType: null == feedType
          ? _value.feedType
          : feedType // ignore: cast_nullable_to_non_nullable
              as FeedType,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as List<ActionType>,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      audienceIds: null == audienceIds
          ? _value.audienceIds
          : audienceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedModelImplCopyWith<$Res>
    implements $FeedModelCopyWith<$Res> {
  factory _$$FeedModelImplCopyWith(
          _$FeedModelImpl value, $Res Function(_$FeedModelImpl) then) =
      __$$FeedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? postedByStore,
      String? storeName,
      String? sender,
      String? reciever,
      String? orderId,
      List<String>? contentUrl,
      FeedType feedType,
      UserType userType,
      String storeId,
      String id,
      String posterId,
      String content,
      String timeStamp,
      List<ActionType> actionType,
      String ownerId,
      List<String> audienceIds});
}

/// @nodoc
class __$$FeedModelImplCopyWithImpl<$Res>
    extends _$FeedModelCopyWithImpl<$Res, _$FeedModelImpl>
    implements _$$FeedModelImplCopyWith<$Res> {
  __$$FeedModelImplCopyWithImpl(
      _$FeedModelImpl _value, $Res Function(_$FeedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postedByStore = freezed,
    Object? storeName = freezed,
    Object? sender = freezed,
    Object? reciever = freezed,
    Object? orderId = freezed,
    Object? contentUrl = freezed,
    Object? feedType = null,
    Object? userType = null,
    Object? storeId = null,
    Object? id = null,
    Object? posterId = null,
    Object? content = null,
    Object? timeStamp = null,
    Object? actionType = null,
    Object? ownerId = null,
    Object? audienceIds = null,
  }) {
    return _then(_$FeedModelImpl(
      postedByStore: freezed == postedByStore
          ? _value.postedByStore
          : postedByStore // ignore: cast_nullable_to_non_nullable
              as bool?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      reciever: freezed == reciever
          ? _value.reciever
          : reciever // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentUrl: freezed == contentUrl
          ? _value._contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      feedType: null == feedType
          ? _value.feedType
          : feedType // ignore: cast_nullable_to_non_nullable
              as FeedType,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value._actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as List<ActionType>,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      audienceIds: null == audienceIds
          ? _value._audienceIds
          : audienceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedModelImpl extends _FeedModel {
  _$FeedModelImpl(
      {this.postedByStore,
      this.storeName,
      this.sender,
      this.reciever,
      this.orderId,
      final List<String>? contentUrl,
      required this.feedType,
      required this.userType,
      required this.storeId,
      required this.id,
      required this.posterId,
      required this.content,
      required this.timeStamp,
      required final List<ActionType> actionType,
      required this.ownerId,
      required final List<String> audienceIds})
      : _contentUrl = contentUrl,
        _actionType = actionType,
        _audienceIds = audienceIds,
        super._();

  factory _$FeedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedModelImplFromJson(json);

  @override
  final bool? postedByStore;
  @override
  final String? storeName;
  @override
  final String? sender;
  @override
  final String? reciever;
  @override
  final String? orderId;
  final List<String>? _contentUrl;
  @override
  List<String>? get contentUrl {
    final value = _contentUrl;
    if (value == null) return null;
    if (_contentUrl is EqualUnmodifiableListView) return _contentUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final FeedType feedType;
  @override
  final UserType userType;
  @override
  final String storeId;
  @override
  final String id;
  @override
  final String posterId;
  @override
  final String content;
  @override
  final String timeStamp;
  final List<ActionType> _actionType;
  @override
  List<ActionType> get actionType {
    if (_actionType is EqualUnmodifiableListView) return _actionType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionType);
  }

  @override
  final String ownerId;
  final List<String> _audienceIds;
  @override
  List<String> get audienceIds {
    if (_audienceIds is EqualUnmodifiableListView) return _audienceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audienceIds);
  }

  @override
  String toString() {
    return 'FeedModel(postedByStore: $postedByStore, storeName: $storeName, sender: $sender, reciever: $reciever, orderId: $orderId, contentUrl: $contentUrl, feedType: $feedType, userType: $userType, storeId: $storeId, id: $id, posterId: $posterId, content: $content, timeStamp: $timeStamp, actionType: $actionType, ownerId: $ownerId, audienceIds: $audienceIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedModelImpl &&
            (identical(other.postedByStore, postedByStore) ||
                other.postedByStore == postedByStore) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.reciever, reciever) ||
                other.reciever == reciever) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality()
                .equals(other._contentUrl, _contentUrl) &&
            (identical(other.feedType, feedType) ||
                other.feedType == feedType) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posterId, posterId) ||
                other.posterId == posterId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality()
                .equals(other._actionType, _actionType) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality()
                .equals(other._audienceIds, _audienceIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postedByStore,
      storeName,
      sender,
      reciever,
      orderId,
      const DeepCollectionEquality().hash(_contentUrl),
      feedType,
      userType,
      storeId,
      id,
      posterId,
      content,
      timeStamp,
      const DeepCollectionEquality().hash(_actionType),
      ownerId,
      const DeepCollectionEquality().hash(_audienceIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedModelImplCopyWith<_$FeedModelImpl> get copyWith =>
      __$$FeedModelImplCopyWithImpl<_$FeedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedModelImplToJson(
      this,
    );
  }
}

abstract class _FeedModel extends FeedModel {
  factory _FeedModel(
      {final bool? postedByStore,
      final String? storeName,
      final String? sender,
      final String? reciever,
      final String? orderId,
      final List<String>? contentUrl,
      required final FeedType feedType,
      required final UserType userType,
      required final String storeId,
      required final String id,
      required final String posterId,
      required final String content,
      required final String timeStamp,
      required final List<ActionType> actionType,
      required final String ownerId,
      required final List<String> audienceIds}) = _$FeedModelImpl;
  _FeedModel._() : super._();

  factory _FeedModel.fromJson(Map<String, dynamic> json) =
      _$FeedModelImpl.fromJson;

  @override
  bool? get postedByStore;
  @override
  String? get storeName;
  @override
  String? get sender;
  @override
  String? get reciever;
  @override
  String? get orderId;
  @override
  List<String>? get contentUrl;
  @override
  FeedType get feedType;
  @override
  UserType get userType;
  @override
  String get storeId;
  @override
  String get id;
  @override
  String get posterId;
  @override
  String get content;
  @override
  String get timeStamp;
  @override
  List<ActionType> get actionType;
  @override
  String get ownerId;
  @override
  List<String> get audienceIds;
  @override
  @JsonKey(ignore: true)
  _$$FeedModelImplCopyWith<_$FeedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

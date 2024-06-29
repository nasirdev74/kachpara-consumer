part of 'feed_page_cubit.dart';

@freezed
abstract class FeedPageState with _$FeedPageState {
  const factory FeedPageState({
    @Default([]) List<FeedItem> feeds,
    @Default(false) bool hasReachedEnd,
    @Default(Status.init) Status status,
  }) = _FeedPageState;
}

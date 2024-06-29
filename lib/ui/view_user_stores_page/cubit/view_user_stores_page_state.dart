part of 'view_user_stores_page_cubit.dart';

@freezed
class ViewUserStoresPageState with _$ViewUserStoresPageState {
  const factory ViewUserStoresPageState({
    final List<Store>? stores,
    final User? user,
    @Default(Status.init) Status fetchUserStoresStatus,
  }) = _ViewUserStoresPageState;
}

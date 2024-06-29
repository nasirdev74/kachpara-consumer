import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/status.dart';

part 'view_user_stores_page_cubit.freezed.dart';
part 'view_user_stores_page_state.dart';

@injectable
class ViewUserStoresPageCubit extends Cubit<ViewUserStoresPageState> {
  ViewUserStoresPageCubit(this._storeUsecase, this._userUseCase) : super(const ViewUserStoresPageState());
  final StoreUsecase _storeUsecase;
  final UserUseCase _userUseCase;
  void getStores(String id) async {
    emit(state.copyWith(fetchUserStoresStatus: Status.loading));
    final User? user = await _userUseCase.getUser(id);

    final result = await _storeUsecase.getStoresByUser(id);
    result.when(success: ((data) {
      emit(state.copyWith(fetchUserStoresStatus: Status.success, stores: data, user: user));
    }), error: (e) {
      emit(state.copyWith(
        fetchUserStoresStatus: Status.failed,
      ));
    });
  }
}

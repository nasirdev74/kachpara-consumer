import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';

import '../../../domain/entities/promotion.dart';
import '../../../utils/status.dart';

part 'all_promotions_page_state.dart';
part 'all_promotions_page_cubit.freezed.dart';

@injectable
class AllPromotionsPageCubit extends Cubit<AllPromotionsPageState> {
  AllPromotionsPageCubit(this._promotionUseCase) : super(const AllPromotionsPageState()) {
    _initPromotions();
  }

  final PromotionUseCase _promotionUseCase;

  Future<void> _initPromotions() async {
    emit(state.copyWith(getPromotionsStatus: Status.loading));
    final stores = getIt<StoreBloc>().state.stores;
    final result = await _promotionUseCase.getPromotionsByUser(stores);

    result.when(
        success: (promotions) {
          emit(state.copyWith(getPromotionsStatus: Status.success, promotions: promotions));
        },
        error: (e) => emit(state.copyWith(getPromotionsStatus: Status.failed)));
  }
}

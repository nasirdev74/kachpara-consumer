import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../../domain/entities/promotion.dart';

part 'promotions_page_state.dart';

part 'promotions_page_cubit.freezed.dart';

@injectable
class PromotionsPageCubit extends Cubit<PromotionsPageState> {
  PromotionsPageCubit(this._promotionUseCase, @factoryParam this.storeId) : super(const PromotionsPageState()) {
    _initPromotions();
  }

  final PromotionUseCase _promotionUseCase;
  final String storeId;

  Future<void> _initPromotions() async {
    emit(state.copyWith(getPromotionsStatus: Status.loading));
    final result = await _promotionUseCase.getPromotions(storeId);
    result.when(
        success: (promotions) {
          emit(state.copyWith(getPromotionsStatus: Status.success, promotions: promotions));
        },
        error: (e) => emit(state.copyWith(getPromotionsStatus: Status.failed)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/gift.dart';
import 'package:kachpara/domain/usecases/gifts_usecase.dart';

import '../../../utils/status.dart';

part 'gifts_page_cubit.freezed.dart';
part 'gifts_page_state.dart';

@injectable
class GiftsPageCubit extends Cubit<GiftsPageState> {
  GiftsPageCubit(this._giftsUseCase) : super(const GiftsPageState()) {
    _initGifts();
  }

  final GiftsUseCase _giftsUseCase;

  Future<void> _initGifts() async {
    emit(state.copyWith(giftsStatus: Status.loading));
    final gifts = await _giftsUseCase.getGifts();
    emit(state.copyWith(giftsStatus: Status.success, gifts: gifts));
  }
}

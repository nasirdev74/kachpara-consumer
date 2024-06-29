import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/curation.dart';
import 'package:kachpara/domain/usecases/curation_usecase.dart';
import 'package:kachpara/utils/status.dart';

part 'curation_detail_page_state.dart';
part 'curation_detail_page_cubit.freezed.dart';

@injectable
class CurationDetailPageCubit extends Cubit<CurationDetailPageState> {
  CurationDetailPageCubit(this._curationUsecase, @factoryParam String curationId) : super(const CurationDetailPageState()) {
    if (state.curation == null) {
      fetchCuration(curationId);
    }
  }

  final CurationUsecase _curationUsecase;

  Future<void> fetchCuration(String curationId) async {
    emit(state.copyWith(fetchCurationStatus: Status.loading));
    final result = await _curationUsecase.getCurationById(curationId);
    result.when(success: ((data) {
      emit(state.copyWith(fetchCurationStatus: Status.success, curation: data));
    }), error: (e) {
      emit(state.copyWith(
        fetchCurationStatus: Status.failed,
      ));
    });
  }
}

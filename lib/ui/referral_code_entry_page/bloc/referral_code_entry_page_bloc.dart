import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/curation.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/curation_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';

import '../../../utils/status.dart';

part 'referral_code_entry_page_event.dart';

part 'referral_code_entry_page_state.dart';

part 'referral_code_entry_page_bloc.freezed.dart';

@injectable
class ReferralCodeEntryPageBloc extends Bloc<ReferralCodeEntryPageEvent, ReferralCodeEntryPageState> {
  ReferralCodeEntryPageBloc(this._storeUsecase, this._curationUsecase) : super(const ReferralCodeEntryPageState()) {
    on<_Add>(onAddStoreOrCuration);
    on<_Entry>(onGetStoreById, transformer: restartable());
  }

  final StoreUsecase _storeUsecase;
  final CurationUsecase _curationUsecase;

  FutureOr<void> onAddStoreOrCuration(_Add event, Emitter<ReferralCodeEntryPageState> emit) async {
    emit(state.copyWith(addStatus: Status.loading));
    if (state.curation != null) {
      final result = await _curationUsecase.addCuration(state.curation!, referralCode: state.referralCode, referredBy: state.referredBy);
      return emit(state.copyWith(addStatus: result.when(success: (_) => Status.success, error: (_) => Status.failed)));
    }
    if (state.store != null) {
      final result = await _storeUsecase.addStore(store: state.store!, referralCode: state.referralCode);
      result.when(success: (data) {
        emit(state.copyWith(addStatus: Status.success));
      }, error: (error) {
        emit(state.copyWith(addStatus: Status.failed, errorMessage: error));
      });
    } else {
      if (kDebugMode) {
        print("Store is null");
      }
    }
  }

  FutureOr<void> onGetStoreById(
      // searching
      _Entry event,
      Emitter<ReferralCodeEntryPageState> emit) async {
    emit(state.copyWith(entryStatus: Status.loading, store: null, curation: null, referredBy: null, referralCode: null));

    final referralCode = event.referralCode;

    // 1. check if referralCode is for store by seller
    await _storeUsecase.getStoreByReferralCode(referralCode).then((value) {
      value.when(success: (data) {
        emit(state.copyWith(entryStatus: Status.success, store: data, referralCode: referralCode));
      }, error: (error) {
        emit(state.copyWith(entryStatus: Status.failed, errorMessage: error));
      });
    });
    // 2. check if referralCode is for list by curator
    await _curationUsecase.getCurationByReferralCode(referralCode).then((value) {
      value.when(success: (data) {
        emit(state.copyWith(entryStatus: Status.success, curation: data, referralCode: referralCode));
      }, error: (error) {
        emit(state.copyWith(entryStatus: Status.failed, errorMessage: error));
      });
    });
    // 3. check if referralCode is user referral code for store or list
    final result = await _storeUsecase.getReferralStoreOrCuration(referralCode: referralCode);
    await result.when(success: (rf) async {
      await _storeUsecase.getStoreById(storeId: rf.storeId!).then((value) {
        value.when(success: (data) {
          emit(state.copyWith(entryStatus: Status.success, store: data, referredBy: rf.ownerUserId, referralCode: referralCode));
        }, error: (error) {
          emit(state.copyWith(entryStatus: Status.failed, errorMessage: error));
        });
      });
      return;
    }, error: (error) {
      // getting store or list by refferal code failed
      debugPrint("error in getting store from code$error");
    });
  }
}

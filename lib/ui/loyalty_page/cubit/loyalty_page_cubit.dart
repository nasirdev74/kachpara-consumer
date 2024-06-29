import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/entities/user_store.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../utils/status.dart';

part 'loyalty_page_cubit.freezed.dart';
part 'loyalty_page_state.dart';

@injectable
class LoyaltyPageCubit extends Cubit<LoyaltyPageState> {
  LoyaltyPageCubit(
    this._storeUsecase,
    this._userUseCase,
    @factoryParam this.storeId,
  ) : super(const LoyaltyPageState()) {
    getVisits();
  }

  final NfcManager _nfcManager = NfcManager.instance;
  final StoreUsecase _storeUsecase;
  final UserUseCase _userUseCase;
  final String storeId;
  bool isVisitsRewardEarned = false;

  Future<void> getVisits({bool showLoader = true, bool showSnackbarAfterSuccess = false}) async {
    if (showLoader) emit(state.copyWith(getLoyaltyStatus: Status.loading));

    final userStore = await _userUseCase.getUserStore(storeId);
    final result = await _storeUsecase.getStoreById(storeId: storeId);
    result.when(
        success: (store) {
          if (userStore!.currentVisits != null && userStore.currentVisits == store.visitsRewardTreshold) {
            isVisitsRewardEarned = true;
          }
          emit(state.copyWith(getLoyaltyStatus: Status.success, store: store, userStore: userStore, showSnackbar: showSnackbarAfterSuccess));
        },
        error: (e) => emit(state.copyWith(getLoyaltyStatus: Status.failed)));
  }

  Future<void> startNFCSession(String? alertMessage) async {
    if ((!await _nfcManager.isAvailable())) return;

    return _nfcManager.startSession(
        alertMessage: alertMessage,
        onDiscovered: (tag) async {
          final data = tag.data;

          try {
            final storeId = getStoreIdFromTag(data);

            if (storeId == null) {
              await _nfcManager.stopSession(alertMessage: "Can't find store.");
              return;
            }

            if (storeId == this.storeId && !isVisitsRewardEarned) {
              // ID from the tag and ID from the screen are matching

              final isVisitAdded = await _userUseCase.updateUserStoreVisitsCount(storeId);
              if (isVisitAdded) await getVisits(showLoader: false, showSnackbarAfterSuccess: true);
            }

            await _nfcManager.stopSession(alertMessage: 'Success!');
            return;
          } catch (e) {
            print('Error with the NFC tagging: $e');
            await _nfcManager.stopSession(alertMessage: 'Something went wrong');
          }
        });
  }

  String? getStoreIdFromTag(Map<String, dynamic> tagData) {
    final dataRecords = tagData['ndef']['cachedMessage']['records'] as List<dynamic>;

    if (dataRecords.isEmpty) return null;

    // Looping through records until we find record that contains storeId
    final storeIdRecord = dataRecords.firstWhere(
      (record) => String.fromCharCodes(record['payload']).contains('storeId:'),
      orElse: () => null,
    );

    if (storeIdRecord == null) return null;

    // Getting storeID from char codes and extracting only number from it
    final storeId = String.fromCharCodes(storeIdRecord['payload']).replaceAll('storeId: ', '');

    return storeId;
  }
}

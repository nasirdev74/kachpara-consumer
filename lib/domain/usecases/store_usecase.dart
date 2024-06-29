import 'package:injectable/injectable.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/data/models/store_model.dart';
import 'package:kachpara/data/sources/firestore/curation_data.dart';
import 'package:kachpara/data/sources/firestore/store_data.dart';
import 'package:kachpara/domain/entities/competition.dart';
import 'package:kachpara/domain/entities/referral_code.dart';
import 'package:kachpara/domain/entities/store.dart';

import '../../core/injector.dart';
import '../../utils/result.dart';

@injectable
class StoreUsecase {
  StoreUsecase(this._storeDataFirebase, this._curationData);

  final StoreDataFirebase _storeDataFirebase;
  final CurationData _curationData;

  Future<Result<List<Store>>> getStores() async {
    final user = getIt<UserBloc>().state.user;
    final List<Store> stores = [];
    final result = await _storeDataFirebase.getStoreIdsByUser(user?.id);
    return result.when(success: (data) async {
      await Future.wait(data.map((e) async {
        return _storeDataFirebase.getStoreById(e);
      })).then((value) {
        for (final element in value) {
          element.when(
              success: (data) {
                stores.add(data.toDomain());
              },
              error: (error) {});
        }
      });

      return Result.success(stores);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<List<Store>>> getStoresByUser(String id) async {
    final List<Store> stores = [];
    final result = await _storeDataFirebase.getStoreIdsByUser(id);
    return result.when(success: (data) async {
      await Future.wait(data.map((e) async {
        return _storeDataFirebase.getStoreById(e);
      })).then((value) {
        for (final element in value) {
          element.when(
              success: (data) {
                stores.add(data.toDomain());
              },
              error: (error) {});
        }
      });

      return Result.success(stores);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<Store>> getStoreById({required String storeId}) async {
    final result = await _storeDataFirebase.getStoreById(storeId.toString());
    return result.when(success: (store) => Result.success(store.toDomain()), error: (e) => Result.error(e));
  }

  Future<Result<StoreModel>> addMainStore({required Store store, String? referralCode}) async {
    // final user = getIt<UserBloc>().state.user;
    final result = await _storeDataFirebase.addMainStore(StoreModel.fromDomain(store));
    return result.when(success: (data) {
      // getIt<StoreBloc>().add(StoreBlocEvent.addStore(store));
      return Result.success(data);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<void>> addStore({required Store store, String? referralCode}) async {
    final user = getIt<UserBloc>().state.user;
    final result = await _storeDataFirebase.addStore(user?.id, StoreModel.fromDomain(store), referralCode: referralCode);
    return result.when(success: (data) {
      getIt<StoreBloc>().add(StoreBlocEvent.addStore(store));
      return const Result.success(null);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<List<Store>>> getStoresByCurationId(String curationId) async {
    final result = await _curationData.getStoreIdsByCuration(curationId.toString());
    final List<Store> stores = [];
    return result.when(success: (data) async {
      await Future.wait(data.map((e) async {
        return _storeDataFirebase.getStoreById(e);
      })).then((value) {
        for (final element in value) {
          element.when(
              success: (data) {
                stores.add(data.toDomain());
              },
              error: (error) {});
        }
      });

      return Result.success(stores);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<Store>> getStoreByReferralCode(String referralCode) async {
    final result = await _storeDataFirebase.getStorebyReferralCode(referralCode);
    return result.when(success: (data) {
      return Result.success(data.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<void>> deleteStore({required Store store}) async {
    final user = getIt<UserBloc>().state.user;
    final result = await _storeDataFirebase.deleteStore(user?.id, store.id);
    return result.when(success: (data) {
      getIt<StoreBloc>().add(StoreBlocEvent.deleteStore(store));
      return const Result.success(null);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<ReferralCode>> getReferralStoreOrCuration({required String referralCode}) async {
    final r = await _storeDataFirebase.getRefferedStoreOrCuration(referralCode);
    return r.when(success: (w) {
      final data = ReferralCode(code: referralCode, storeId: w["storeId"], curationId: w["curationId"], ownerUserId: w["ownerUserId"]);
      return Result.success(data);
    }, error: (e) {
      return Result.error(e);
    });
  }

  Future<Result<Store>> getStoreByPlaceId(String placeId) async {
    final result = await _storeDataFirebase.getStorebyPlaceId(placeId);
    return result.when(success: (data) {
      return Result.success(data.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Competition?> getCurrentCompetition(String storeId) async {
    final competitionModel = await _storeDataFirebase.getCurrentCompetition(storeId);
    return competitionModel!.toDomain();
  }

  Future<Result<Store>> updateStore({required StoreModel store}) => _storeDataFirebase.updateStore(store: store);
  Future<Map<String, String>> getStoreReferralCodesByUser(String? userId) => _storeDataFirebase.getStoreReferralCodesByUser(userId);
}

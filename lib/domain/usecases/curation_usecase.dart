import 'package:injectable/injectable.dart';
import 'package:kachpara/app/curation_bloc/curation_bloc.dart';
import 'package:kachpara/data/models/curation_model.dart';
import 'package:kachpara/data/sources/firebase_auth/auth_data.dart';
import 'package:kachpara/data/sources/firestore/curation_data.dart';
import 'package:kachpara/domain/entities/curation.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';

import '../../app/store_bloc/store_bloc.dart';
import '../../core/injector.dart';
import '../../utils/result.dart';

@injectable
class CurationUsecase {
  final CurationData _curationData;
  final AuthData _authData;
  final StoreUsecase _storeUsecase;

  CurationUsecase(this._curationData, this._authData, this._storeUsecase);

  Future<Result<List<Curation>>> getCurations() async {
    final List<Curation> curations = [];

    // that means that is very first launch app so they have no curations
    if (!_authData.isLoggedIn()) return Result.success(curations);

    final result = await _curationData.getCuration(_authData.getUid()!);
    return result.when(success: (data) async {
      await Future.wait(data.map((e) async {
        return _storeUsecase.getStoresByCurationId(e.id);
      })).then((value) {
        for (var i = 0; i < value.length; i++) {
          value[i].when(success: (stores) {
            curations.add(Curation(
                id: data[i].id,
                name: data[i].name,
                referralCode: data[i].referralCode,
                ownerUserId: data[i].ownerUserId,
                domain: data[i].domain,
                curatorName: data[i].curatorName,
                description: data[i].description,
                imageFileName: data[i].imageFileName,
                stores: stores));
          }, error: (e) {
            print(e);
          });
        }
      });

      return Result.success(curations);
    }, error: (e) {
      print(e);
      return Result.error(e);
    });
  }

  Future<Result<void>> addCuration(Curation curation, {String? referralCode, String? referredBy}) async {
    final curationResult = await getCurationById(curation.id);
    curationResult.when(success: (data) async {
      return const Result.error("Curation already exists");
    }, error: (error) {
      return Result.error(error);
    });

    // add stores under curation into StoreBloc
    final storesResult = await _storeUsecase.getStoresByCurationId(curation.id);
    storesResult.when(success: (stores) async {
      Map<String, String> referralCodes = await _storeUsecase.getStoreReferralCodesByUser(curation.ownerUserId);

      for (Store store in stores) {
        await _storeUsecase.addStore(store: store, referralCode: referralCodes[store.id]);
      }
    }, error: (error) {
      print("error in inserting stores from curation");
    });

    // curation id under user.curations
    final result = await _curationData.addCuration(_authData.getUid()!, CurationModel.fromDomain(curation), referralCode: referralCode, referredBy: referredBy);
    return result.when(success: (data) {
      getIt<CurationBloc>().add(CurationBlocEvent.added(curation: curation));
      return const Result.success(null);
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<Curation>> getCurationById(String id) async {
    final result = await _curationData.getCurationById(id);
    return result.when(success: (curationModel) async {
      var curation = curationModel.toDomain();
      final storesResult = await _storeUsecase.getStoresByCurationId(id);
      return storesResult.when(success: (stores) {
        return Result.success(curation.copyWith(stores: stores));
      }, error: (error) {
        return Result.error(error);
      });
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<Curation>> getCurationByReferralCode(String referralCode) async {
    final result = await _curationData.getCurationByReferralCode(referralCode);
    return result.when(success: (data) {
      return Result.success(data.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<void>> deleteCuration(Curation curation) async {
    final result = await _curationData.deleteCuration(_authData.getUid()!, curation.id);
    return result.when(success: (data) {
      getIt<CurationBloc>().add(CurationBlocEvent.deleted(curation: curation));
      return const Result.success(null);
    }, error: (error) {
      return Result.error(error);
    });
  }
}

import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/firestore/address_data.dart';
import 'package:kachpara/data/sources/firestore/user_data.dart';
import 'package:kachpara/domain/entities/address.dart';

import '../../app/selected_items_bloc/selected_items_bloc.dart';
import '../../data/models/address_model.dart';
import '../../utils/result.dart';

@injectable
class AddressUseCases {
  final AddressData _addressData;
  final UserData _userData;

  AddressUseCases(this._addressData, this._userData);

  Future<Result<void>> addAddress(Address address) async {
    final user = getIt<UserBloc>().state.user;

    if (user == null) {
      return const Result.error("User not found");
    }
    late String addressId;
    final result = await _addressData.addAddress(user.id, AddressModel.fromDomain(address));
    result.when(success: (data) {
      addressId = data.id;
    }, error: (error) {
      return Result.error(error);
    });

    if (user.selectedAddressId == null) {
      _userData.updateSelectedAddress(user.id, addressId);
      getIt<SelectedItemsBloc>().add(SelectedItemsEvent.setAddress(address: address.copyWith(id: addressId)));
    }

    return const Result.success(null);
  }

  Future<Result<List<Address>>> getAddresses() async {
    final user = getIt<UserBloc>().state.user;
    if (user != null) {
      final result = await _addressData.getAddresses(user.id);
      return result.when(success: (data) {
        return Result.success(data.map((e) => e.toDomain()).toList());
      }, error: (error) {
        return Result.error(error);
      });
    } else {
      return const Result.error("User not found");
    }
  }

  Future<Result<void>> deleteAddress(String addressId) async {
    final user = getIt<UserBloc>().state.user;
    if (user != null) {
      final result = await _addressData.deleteAddress(user.id, addressId);
      return result.when(success: (data) {
        return const Result.success(null);
      }, error: (error) {
        return Result.error(error);
      });
    } else {
      return const Result.error("User not found");
    }
  }

  Future<Result<void>> updateAddress(Address address) async {
    final user = getIt<UserBloc>().state.user;
    if (user != null) {
      final result = await _addressData.updateAddress(user.id, AddressModel.fromDomain(address));
      return result.when(success: (data) {
        return const Result.success(null);
      }, error: (error) {
        return Result.error(error);
      });
    } else {
      return const Result.error("User not found");
    }
  }

  Future<Result<void>> setSelectedAddress(String addressId) async {
    final user = getIt<UserBloc>().state.user;
    if (user != null) {
      final result = await _addressData.setSelectedAddress(user.id, addressId);
      return result.when(success: (data) {
        return const Result.success(null);
      }, error: (error) {
        return Result.error(error);
      });
    } else {
      return const Result.error("User not found");
    }
  }

  Future<Result<Address?>> getSelectedAddress() async {
    final user = getIt<UserBloc>().state.user;
    if (user?.selectedAddressId == null) return const Result.success(null);
    final result = await _addressData.getSelectedAddress(user!.id, user.selectedAddressId);
    return result.when(success: (data) {
      return Result.success(data.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }
}

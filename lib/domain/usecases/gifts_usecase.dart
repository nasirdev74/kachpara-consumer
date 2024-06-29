import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/firestore/gifts_data.dart';
import 'package:kachpara/domain/entities/gift.dart';

@injectable
class GiftsUseCase {
  final GiftsData _giftsData;

  GiftsUseCase(this._giftsData);

  Future<List<Gift>> getGifts() async {
    final user = getIt<UserBloc>().state.user;
    return await _giftsData.getGifts(user!.id);
  }

  Future<void> claimGift(String orderId) async {
    final user = getIt<UserBloc>().state.user;
    await _giftsData.claimGift(user!.id, orderId);
  }
}

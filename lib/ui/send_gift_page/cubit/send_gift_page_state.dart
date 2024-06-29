part of 'send_gift_page_cubit.dart';

@freezed
class SendGiftPageState with _$SendGiftPageState {
  const factory SendGiftPageState(
      {@Default(Status.init) Status sendGiftPageStatus,
      String? orderId,
      String? sendGiftPageError,
      Store? store,
      Promotion? freePromotion,
      User? user}) = _SendGiftPageState;
}

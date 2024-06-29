import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/domain/entities/gift.dart';

part 'gift_model.freezed.dart';
part 'gift_model.g.dart';

@freezed
class GiftModel with _$GiftModel {
  GiftModel._();
  factory GiftModel({
    required String type,
    String? senderUserId,
    required String orderId,
    required String status,
    String? senderName,
    String? giftDescription,
  }) = _GiftModel;

  factory GiftModel.fromJson(Map<String, dynamic> json) => _$GiftModelFromJson(json);

  factory GiftModel.fromDomain(Gift gift) {
    return GiftModel(
      type: gift.type,
      senderUserId: gift.senderUserId,
      orderId: gift.orderId,
      status: gift.status,
      senderName: gift.senderName,
      giftDescription: gift.giftDescription,
    );
  }

  Gift toDomain() {
    return Gift(
      orderId: orderId,
      type: type,
      senderUserId: senderUserId,
      status: status,
      senderName: senderName,
      giftDescription: giftDescription,
    );
  }
}

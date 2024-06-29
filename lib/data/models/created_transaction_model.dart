import 'package:freezed_annotation/freezed_annotation.dart';
part 'created_transaction_model.g.dart';
part 'created_transaction_model.freezed.dart';

@freezed
class CreatedTransactionModel with _$CreatedTransactionModel {
  const CreatedTransactionModel._();

  const factory CreatedTransactionModel({
    @Default("") String id,
    @Default("") String state,
  }) = _CreatedTransactionModel;

  factory CreatedTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedTransactionModelFromJson(json);
}

deserializeCreatedTransactionModel(Map<String, dynamic> json) {
  return CreatedTransactionModel.fromJson(
      json["cards"].cast<String, dynamic>());
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_model.g.dart';
part 'token_model.freezed.dart';

@freezed
class TokenModel with _$TokenModel {
  const TokenModel._();

  const factory TokenModel({
    @Default("") String id,
    @Default("") String blockchain,
    @Default("") String name,
    @Default("") String symbol,
    @Default(0) int decimals,
    @Default(false) bool isNative,
    DateTime? updateDate,
    DateTime? createDate,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map json) => _$TokenModelFromJson(json.cast());
}

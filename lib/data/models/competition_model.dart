import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/competition.dart';
import '../../utils/timestamp_to_datetime.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

part 'competition_model.freezed.dart';
part 'competition_model.g.dart';

@freezed
class CompetitionModel with _$CompetitionModel {
  CompetitionModel._();
  factory CompetitionModel({
    required String prize,
    required Map<String, num> outreach,
    required Map<String, num> directreach,
    required Map<String, num> orders,
    @DateTimeConverter() DateTime? startDate,
    @DateTimeConverter() DateTime? endDate,
  }) = _CompetitionModel;

  factory CompetitionModel.fromJson(Map<String, dynamic> json) => _$CompetitionModelFromJson(json);

  factory CompetitionModel.fromDomain(Competition competition) {
    return CompetitionModel(
        prize: competition.prize,
        outreach: competition.outreach,
        directreach: competition.directreach,
        orders: competition.orders,
        startDate: competition.startDate,
        endDate: competition.endDate);
  }

  Competition toDomain() {
    return Competition(prize: prize, outreach: outreach, directreach: directreach, orders: orders, startDate: startDate, endDate: endDate);
  }
}

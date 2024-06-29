part of 'referral_code_entry_page_bloc.dart';

@freezed
class ReferralCodeEntryPageEvent with _$ReferralCodeEntryPageEvent {
  const factory ReferralCodeEntryPageEvent.add() = _Add;
  const factory ReferralCodeEntryPageEvent.entry(
    String referralCode,
  ) = _Entry;
}

part of 'contacts_page_cubit.dart';

@freezed
class ContactsPageState with _$ContactsPageState {
  const factory ContactsPageState({
    final List<Contact>? contacts,
    @Default(Status.init) Status fetchContactsStatus,
  }) = _ContactsPageState;
}

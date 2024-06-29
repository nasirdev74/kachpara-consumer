import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/usecases/contacts_usecase.dart';
import 'package:kachpara/utils/status.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../../../domain/entities/user.dart';

part 'contacts_page_cubit.freezed.dart';
part 'contacts_page_state.dart';

@injectable
class ContactsPageCubit extends Cubit<ContactsPageState> {
  ContactsPageCubit(this._contactsUseCase) : super(const ContactsPageState()) {
    _initialize();
  }
  final ContactsUseCase _contactsUseCase;
  void _initialize() async {
    emit(state.copyWith(fetchContactsStatus: Status.loading));
    final user = getIt<UserBloc>().state.user!;
    final result = await _contactsUseCase.getContacts(user);
    result.when(success: ((data) {
      emit(state.copyWith(fetchContactsStatus: Status.success, contacts: data));
    }), error: (e) {
      emit(state.copyWith(
        fetchContactsStatus: Status.failed,
      ));
    });
  }

  Future<User?> getUserByContact(Contact selectedContact) async {
    return await _contactsUseCase.getUserByContact(selectedContact);
  }
}

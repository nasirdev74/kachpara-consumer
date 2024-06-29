import 'package:injectable/injectable.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:kachpara/data/sources/firestore/user_data.dart';
import '../../utils/result.dart';
import '../entities/user.dart';

@injectable
class ContactsUseCase {
  ContactsUseCase(this._userData);
  final UserData _userData;
  Future<Result<List<Contact>>> getContacts(User user) async {
    if (await FlutterContacts.requestPermission(readonly: true)) {
      var data = await FlutterContacts.getContacts(withProperties: true);
      List<Contact> contacts = [];
      List<String> newContactUserIds = [];

      await Future.wait(data.map((element) async {
        if (element.phones.isNotEmpty) {
          String selectedPhoneNum = element.phones[0].number.replaceAll(' ', '');

          var contactUser = await _userData.getUserByPhoneNumber(selectedPhoneNum);
          if (contactUser != null && contactUser.id != user.id) {
            contacts.add(element);

            // Check if the contactUser.id is not in the newContactUserIds list
            if (!newContactUserIds.contains(contactUser.id)) {
              newContactUserIds.add(contactUser.id);
            }
          }
        }
      }));

      // Update user with all new contactUserIds in one batch
      if (newContactUserIds.isNotEmpty) {
        await _userData.updateContactUserIds(user.id, newContactUserIds);
      }

      return Result.success(contacts);
    } else {
      return const Result.error('Permissions to read contacts was not granted');
    }
  }

  Future<User?> getUserByContact(Contact selectedContact) async {
    String selectedPhoneNum = selectedContact.phones[0].number.replaceAll(' ', '');
    return await _userData.getUserByPhoneNumber(selectedPhoneNum);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/ui/contacts_page/cubit/contacts_page_cubit.dart';
import 'package:kachpara/ui/view_user_stores_page/view_user_stores_page.dart';
import 'package:kachpara/utils/status.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = 'contacts_page';
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContactsPageCubit>(),
      child: const ContactsPageLayout(),
    );
  }
}

class ContactsPageLayout extends StatefulWidget {
  const ContactsPageLayout({super.key});

  @override
  State<ContactsPageLayout> createState() => _ContactsPageLayoutState();
}

class _ContactsPageLayoutState extends State<ContactsPageLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsPageCubit, ContactsPageState>(
      builder: (context, state) {
        if (state.fetchContactsStatus == Status.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
          );
        }
        List<Contact> contacts = state.contacts ?? [];
        return Scaffold(
          appBar: AppBar(title: Text(context.l10n.contacts), centerTitle: true, automaticallyImplyLeading: false),
          body: contacts.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        context.l10n.you_have_no_contacts,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return InkWell(
                      onTap: () async {
                        var user = await context.read<ContactsPageCubit>().getUserByContact(contacts[index]);
                        context.pushNamed(ViewUserStoresPage.routeName, queryParameters: {'id': user!.id});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding as needed
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  contact.displayName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            leading: contact.photo == null
                                ? null
                                : CircleAvatar(
                                    backgroundImage: MemoryImage(contact.photo!),
                                    radius: 30,
                                  ),
                          ),
                        ),
                      ),
                    );
                  }),
        );
      },
    );
  }
}

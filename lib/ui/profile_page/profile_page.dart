import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/add_student_email_page/add_student_email_page.dart';
import 'package:kachpara/ui/address_list_page/address_list_page.dart';
import 'package:kachpara/ui/all_promotions_page/all_promotions_page.dart';
import 'package:kachpara/ui/contacts_page/contacts_page.dart';
import 'package:kachpara/ui/gifts_page/gifts_page.dart';
import 'package:kachpara/ui/login_page/login_page.dart';
import 'package:kachpara/ui/my_oders_page/my_orders_page.dart';
import 'package:kachpara/ui/payment_methods_page/payment_methods_page.dart';
import 'package:kachpara/ui/profile_page/cubit/profile_page_cubit.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as ctcts;
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/payment_card.dart';
import '../../domain/entities/user.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = 'profile_page';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfilePageCubit>(),
      child: const ProfilePageLayout(),
    );
  }
}

class ProfilePageLayout extends StatefulWidget {
  const ProfilePageLayout({
    super.key,
  });

  @override
  State<ProfilePageLayout> createState() => _ProfilePageLayoutState();
}

class _ProfilePageLayoutState extends State<ProfilePageLayout> with RouteAware {
  late final nameController = TextEditingController();
  late final phoneController = TextEditingController();
  late final studentEmailController = TextEditingController();
  // bool sync = false;
  // final contactsCubit = getIt<ContactsPageCubit>();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final user = context.select<UserBloc, User>(
      (value) => value.state.user!,
    );

    final address = context.select<SelectedItemsBloc, Address?>(
      (value) => value.state.selectedAddress,
    );

    final paymentMethod = context.select<SelectedItemsBloc, PaymentCard?>(
      (value) => value.state.selectedPaymentMethod,
    );

    nameController.text = user.name ?? "";
    phoneController.text = user.phoneNo ?? "";
    studentEmailController.text = user.studentEmail ?? "";

    final addressText = address?.address ?? context.l10n.profile_page_address_text;
    final paymentMethodText = paymentMethod?.brand ?? context.l10n.profile_page_payment_method_text;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile_page_profile),
      ),
      endDrawer: Builder(builder: (context) {
        final user = getIt<UserBloc>().state.user;
        return Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/guest_profile.jpg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user?.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              // if (stores.isNotEmpty)
              ListTile(
                key: const Key("gifts"),
                title: const Text('Hediyeler'),
                onTap: () {
                  context.pushNamed(GiftsPage.routeName);
                  Scaffold.of(context).closeDrawer();
                },
              ),

              const Divider(),

              ListTile(
                title: Text(context.l10n.nav_bar_my_orders),
                onTap: () {
                  context.pushNamed(MyOrdersPage.routeName);
                  Scaffold.of(context).closeDrawer();
                },
              ),
              const Divider(),

              Padding(
                key: const Key("inviteFriends"),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  child: Text(context.l10n.invite_friends),
                  onPressed: () {
                    if (Platform.isIOS) {
                      Share.share('${context.l10n.checkout_my_website} https://apps.apple.com/us/app/kachpara/id1534517750');
                    } else if (Platform.isAndroid) {
                      Share.share('${context.l10n.checkout_my_website} https://play.google.com/store/apps/details?id=com.kachpara.customer_app');
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              const SizedBox(height: 10),
              EditableTextField(
                controller: nameController,
                label: context.l10n.profile_page_name,
                responsibility: ResponsibilyEdititableTextField.userName,
                user: user,
              ),
              const SizedBox(height: 10),
              if (user.studentEmail == "")
                InkWell(
                  onTap: () {
                    context.pushNamed(AddStudentEmailPage.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SafeArea(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              context.l10n.checkout_page_add_student_email,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                        )
                      ],
                    )),
                  ),
                )
              else
                EditableTextField(
                  controller: studentEmailController,
                  label: context.l10n.profile_page_student_email,
                  responsibility: ResponsibilyEdititableTextField.userStudentEmail,
                  user: user,
                ),
              const SizedBox(height: 15),
              EditableTextField(
                controller: phoneController,
                label: context.l10n.profile_page_phone,
                responsibility: ResponsibilyEdititableTextField.userPhoneNumber,
                user: user,
              ),
              const SizedBox(height: 10),
              // Row(
              //   children: [
              //     const SizedBox(width: 10),
              //     Text(context.l10n.sync_contacts),
              //     const Spacer(),
              //     FlutterSwitch(
              //       value: sync,
              //       activeColor: Theme.of(context).primaryColor,
              //       onToggle: (val) async {
              //         if (await ctcts.FlutterContacts.requestPermission(readonly: true)) {
              //           final SharedPreferences prefs = await SharedPreferences.getInstance();
              //           await prefs.setBool('contactSync', val);
              //           setState(() {
              //             sync = val;
              //           });
              //         } else {
              //           showSnackBar(context, 'You have disabled contacts permissions. Enable them in settings to access contact sync');
              //         }
              //       },
              //     ),
              //     const SizedBox(width: 10),
              //   ],
              // ),
              // const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  context.pushNamed(AddressListPage.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SafeArea(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.l10n.checkout_page_delivery_address),
                          Text(addressText, style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  )),
                ),
              ),
              // const SizedBox(height: 10),
              // InkWell(
              //   onTap: () {
              //     context.pushNamed(PaymentMethodsPage.routeName);
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.all(16),
              //     decoration: BoxDecoration(
              //       color: Colors.grey,
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: SafeArea(
              //         child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(context.l10n.checkout_page_payment_methods),
              //             Text(paymentMethodText, style: const TextStyle(fontSize: 15)),
              //           ],
              //         ),
              //         const Icon(Icons.arrow_forward)
              //       ],
              //     )),
              //   ),
              // ),
              const SizedBox(height: 10),
              ContactUSButton(),
              const SizedBox(height: 10),
              PrivacyButton(),
              const SizedBox(height: 10),
              DeleteAccountButton(),
              // const VerticallBigSpace(),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 70),
              //   child: OutlinedButton(
              //       onPressed: () {
              //         context.read<ProfilePageCubit>().logout();
              //       },
              //       child: Text(context.l10n.profile_page_logout)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUSButton extends StatelessWidget {
  const ContactUSButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Replace 'phoneNumber' with the WhatsApp phone number you want to contact
        final phoneNumber = '+905348995147'; // Example phone number

        // Construct the WhatsApp URL
        final url = 'https://wa.me/$phoneNumber';

        // Launch the WhatsApp URL
        launchWhatsApp(url);
      },
      child: Text(
        context.l10n.profile_page_contactus,
        style: TextStyle(
          fontSize: 20, // Change the font size as per your requirement
          color: Colors.white, // Optional: Set text color
        ),
      ),
    );
  }

  // Function to launch the WhatsApp URL
  void launchWhatsApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PrivacyButton extends StatelessWidget {
  const PrivacyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Construct the WhatsApp URL
        final url = 'https://kachpara.com/privacy_policy.html';

        // Launch the WhatsApp URL
        launchWhatsApp(url);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.profile_page_privacy_policy,
            style: TextStyle(
              fontSize: 20, // Change the font size as per your requirement
              color: Colors.white, // Optional: Set text color
            ),
          ),
          SizedBox(width: 5), // Add some spacing between the text and the icon
          Icon(
            Icons.open_in_new, // This is the icon for an external link
            color: Colors.white, // Optional: Set icon color
          ),
        ],
      ),
    );
  }

  // Function to launch the WhatsApp URL
  void launchWhatsApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Set your desired background color here
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirm Deletion'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to delete your account? All your data will be deleted!!!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Delete'),
                onPressed: () {
                  // Call the Cubit method to delete the account
                  getIt<UserBloc>().add(const UserEvent.deleteUser());
                  context.goNamed(LoginPage.routeName);
                },
              ),
            ],
          ),
        );
      },
      child: Text('Delete Account'),
    );
  }
}

class EditableTextField extends StatefulWidget {
  const EditableTextField({super.key, this.controller, this.disabled = false, required this.label, required this.responsibility, required this.user});

  final TextEditingController? controller;
  final bool disabled;
  final String label;
  final ResponsibilyEdititableTextField responsibility;
  final User user;

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  late final FocusNode _focusNode = FocusNode();
  bool editable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: editable ? const Color(0xffEDEDED) : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  key: const Key("inputName"),
                  focusNode: _focusNode,
                  controller: widget.controller,
                  enabled: editable,
                  decoration: InputDecoration(
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: false,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    labelText: widget.label,
                  ),
                ),
              ),
              if (!(widget.responsibility == ResponsibilyEdititableTextField.userPhoneNumber))
                IconButton(
                  key: widget.responsibility == ResponsibilyEdititableTextField.userStudentEmail ? const Key("student_email_edit_icon") : const Key("editIcon"),
                  onPressed: () {
                    if (widget.responsibility == ResponsibilyEdititableTextField.userStudentEmail) {
                      context.goNamed("add_student_email_page");
                    }
                    if (editable) {
                      // need to put the proper ID below
                      switch (widget.responsibility) {
                        case ResponsibilyEdititableTextField.userName:
                          context.read<ProfilePageCubit>().updateUser(widget.user.copyWith(name: widget.controller?.text));
                          break;
                        default:
                          break;
                      }
                    }
                    setState(() {
                      editable = !editable;
                      if (_focusNode.hasFocus) {
                        _focusNode.unfocus();
                      } else {
                        _focusNode.requestFocus();
                      }
                    });
                  },
                  icon: Icon(
                    editable ? Icons.done : Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
            ],
          ),
          const Divider(
            height: 2,
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
enum ResponsibilyEdititableTextField { userName, userPhoneNumber, userStudentEmail }

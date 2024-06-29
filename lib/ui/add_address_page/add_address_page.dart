import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:kachpara/widgets/text_field.dart';

import '../../domain/entities/address.dart';
import '../../utils/status.dart';
import 'cubit/add_address_page_cubit.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key, this.address});

  final Address? address;

  static const String routeName = "add_address_page";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddAddressPageCubit>(),
      child: _AddAddressPageLayout(
        address: address,
      ),
    );
  }
}

class _AddAddressPageLayout extends StatefulWidget {
  const _AddAddressPageLayout({this.address});
  final Address? address;

  @override
  State<_AddAddressPageLayout> createState() => __AddAddressPageLayoutState();
}

class __AddAddressPageLayoutState extends State<_AddAddressPageLayout> {
  late final TextEditingController _nameController = TextEditingController()..text = widget.address?.name ?? "";

  late final TextEditingController _addressController = TextEditingController()..text = widget.address?.address ?? "";
  late final TextEditingController _directionController = TextEditingController()..text = widget.address?.direction ?? "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.add_address_page_add_address),
        centerTitle: true,
      ),
      body: BlocListener<AddAddressPageCubit, AddAddressPageState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            showSnackBar(context, context.l10n.add_address_page_message_successful);
            Navigator.of(context).pop();
          } else if (state.status == Status.failed) {
            showSnackBar(context, state.error ?? context.l10n.add_address_page_message_went_wrong);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    AppTextField(
                      key: const Key("addressName"),
                      controller: _nameController,
                      label: context.l10n.add_address_page_name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.add_address_page_enter_name;
                        } else if (value.length > 20) {
                          return "max limit is 20 characters";
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      key: const Key("addressField"),
                      controller: _addressController,
                      label: context.l10n.add_address_page_address,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.add_address_page_enter_address_line;
                        } else if (value.length > 100) {
                          return "max limit is 100 characters";
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      key: const Key("directionField"),
                      controller: _directionController,
                      label: context.l10n.add_address_page_direction,
                      validator: (value) {
                        if (value != null && value.length > 100) {
                          return "max limit is 100 characters";
                        }
                        return null;
                      },
                    ),
                    const VerticallSmallSpace(),
                    ButtonWidget(
                        key: const Key("saveAddress"),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            debugPrint(context.l10n.add_address_page_validated);
                            if (widget.address == null) {
                              await context.read<AddAddressPageCubit>().addAddress(Address(
                                    id: "",
                                    name: _nameController.text,
                                    address: _addressController.text,
                                    direction: (_directionController.text != "") ? _directionController.text : null,
                                  ));
                            } else {
                              await context.read<AddAddressPageCubit>().updateAddress(Address(
                                    id: widget.address!.id,
                                    name: _nameController.text,
                                    address: _addressController.text,
                                    direction: (_directionController.text != "") ? _directionController.text : null,
                                  ));
                            }
                          }
                        },
                        text: context.l10n.common_button_save),
                    const VerticallSmallSpace(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

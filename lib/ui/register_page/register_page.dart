import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/register_page/cubit/register_page_cubit.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:kachpara/widgets/text_field.dart';

import '../../utils/status.dart';
import '../home_page/home_page.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = 'register_page';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterPageCubit>(
      create: (context) => getIt<RegisterPageCubit>(),
      child: const _RegisterPageLayout(),
    );
  }
}

class _RegisterPageLayout extends StatefulWidget {
  const _RegisterPageLayout();

  @override
  State<_RegisterPageLayout> createState() => _RegisterPageLayoutState();
}

class _RegisterPageLayoutState extends State<_RegisterPageLayout> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController = TextEditingController();

  String? _validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.register_page_enter_name;
      // return 'Please enter a valid full name';
    }

    // // Check if the full name contains only letters and spaces
    // if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    //   return context.l10n.register_page_enter_name_without_numbers;
    //   // return 'Please enter a valid full name without numbers or special characters';
    // }

    // // Check if the full name contains at least two words (assuming first name and last name)
    // if (value.trim().split(' ').length < 2) {
    //   return context.l10n.register_page_enter_name_with_empty_space;
    //   // return 'Please enter a valid full name';
    // }

    return null; // Validation passed
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterPageCubit, RegisterPageState>(
      listener: (context, state) {
        if (state.registerStatus == Status.success) {
          context.goNamed(HomePage.routeName);
        } else if (state.registerStatus == Status.failed) {
          showSnackBar(context, context.l10n.register_page_enter_registration_failed);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const VerticallBigSpace(),
                        Text(
                          context.l10n.register_page_enter_personel_information,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        const VerticallBigSpace(),
                        Text(
                          context.l10n.register_page_share_name_email_address,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        const VerticallBigSpace(),
                        AppTextField(
                            key: const Key('fullName'),
                            controller: _nameController,
                            label: context.l10n.register_page_name,
                            hint: context.l10n.register_page_enter_name,
                            validator: _validateFullName),
                      ],
                    ),
                  ),
                ),
                const VerticallBigSpace(),
                ButtonWidget(
                    key: const Key('register'),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() == true) {
                        await context.read<RegisterPageCubit>().register(_nameController.text.trim());
                      }
                    },
                    text: context.l10n.register_page_get_started),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

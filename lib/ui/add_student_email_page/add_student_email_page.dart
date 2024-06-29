import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/ui/add_student_email_page/cubit/add_student_email_page_cubit.dart';
import 'package:kachpara/ui/verify_student_email_page/verify_student_email_page.dart';
import 'package:kachpara/utils/random_number.dart';
import 'package:kachpara/utils/status.dart';

class AddStudentEmailPage extends StatefulWidget {
  static const String routeName = "add_student_email_page";

  const AddStudentEmailPage({super.key});

  @override
  State<AddStudentEmailPage> createState() => _AddStudentEmailPageState();
}

class _AddStudentEmailPageState extends State<AddStudentEmailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => getIt<AddStudentEmailPageCubit>(), child: const AddStudentEmailPageLayout());
  }
}

class AddStudentEmailPageLayout extends StatefulWidget {
  const AddStudentEmailPageLayout({super.key});

  @override
  State<AddStudentEmailPageLayout> createState() => _AddStudentEmailPageLayoutState();
}

class _AddStudentEmailPageLayoutState extends State<AddStudentEmailPageLayout> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isValidStudentEmail = false;
  late int code;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.add_student_email_page_title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              context.l10n.add_student_email_page_description,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: const Key("student_email_input"),
                    controller: _controller,
                    onChanged: (value) {
                      final allowedSuffixes = ['edu.tr', 'edu'];
                      final suffixPattern = allowedSuffixes.join('|');

                      final regex = RegExp('^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+.)+($suffixPattern)\$');

                      setState(() {
                        (value.isNotEmpty && !regex.hasMatch(value)) ? isValidStudentEmail = false : isValidStudentEmail = true;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: context.l10n.add_student_email_page_email,
                        hintText: context.l10n.add_student_email_page_student_email_hint,
                        suffixIcon: IconButton(
                            onPressed: () {
                              _controller.clear();
                            },
                            icon: const Icon(Icons.clear))),
                    autofillHints: const [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      key: const Key("verify_student_email"),
                      onPressed: isValidStudentEmail
                          ? () {
                              final form = _formKey.currentState;
                              if (form != null) {
                                setState(() {
                                  isValidStudentEmail = false;
                                });
                                setState(() {
                                  code = RandomNumber.generate();
                                });
                                context.read<AddStudentEmailPageCubit>().sendVerificationToStudentEmail(_controller.text, code);
                              }
                            }
                          : null,
                      child: BlocConsumer<AddStudentEmailPageCubit, AddStudentEmailPageState>(
                        listener: (context, state) {
                          if (state.sendingEmailStatus == Status.success) {
                            if (_controller.text == "test@kachpara.edu") {
                              code = 123456; // override for testing
                            }
                            context.goNamed(VerifyStudentEmailPage.routeName,
                                pathParameters: {"student_email": _controller.text, "verification_code": code.toString()});
                          } else if (state.sendingEmailStatus == Status.failed) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(content: Text(state.getErrorMessage ?? "")));
                          }
                        },
                        builder: (context, state) {
                          print(state.sendingEmailStatus);
                          if (state.sendingEmailStatus == Status.loading) {
                            return const CircularProgressIndicator.adaptive();
                          }
                          return Text(context.l10n.add_student_email_page_validate_email);
                        },
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

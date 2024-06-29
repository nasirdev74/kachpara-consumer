import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/ui/add_student_email_page/cubit/add_student_email_page_cubit.dart';
import 'package:kachpara/ui/login_page/cubit/login_page_cubit.dart';
import 'package:kachpara/ui/verify_student_email_page/cubit/verify_student_email_page_cubit.dart';
import 'package:kachpara/utils/random_number.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyStudentEmailPage extends StatefulWidget {
  static const String routeName = "verify_student_email_page";
  final String studentEmail;
  String verificationCode;

  VerifyStudentEmailPage({super.key, required this.studentEmail, required this.verificationCode});

  @override
  State<VerifyStudentEmailPage> createState() => _VerifyStudentEmailPageState();
}

class _VerifyStudentEmailPageState extends State<VerifyStudentEmailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginPageCubit>()),
        BlocProvider<VerifyStudentEmailPageCubit>(
          create: (context) => getIt<VerifyStudentEmailPageCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddStudentEmailPageCubit>(),
        ),
      ],
      child: VerifyStudentEmailPageLayout(
        studentEmail: widget.studentEmail,
        verificationCode: widget.verificationCode,
      ),
    );
  }
}

class VerifyStudentEmailPageLayout extends StatefulWidget {
  VerifyStudentEmailPageLayout({super.key, required this.studentEmail, required this.verificationCode});
  final String studentEmail;
  String verificationCode;

  @override
  _VerifyStudentEmailPageLayout createState() => _VerifyStudentEmailPageLayout();
}

class _VerifyStudentEmailPageLayout extends State<VerifyStudentEmailPageLayout> {
  final _formKeyPassword = GlobalKey<FormState>();
  late final codeController = TextEditingController();

  late String pinCode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKeyPassword,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.login_page_verification_code,
                    style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
                  ),
                  const VerticallSmallSpace(),
                  RichText(
                    text: TextSpan(text: context.l10n.verify_student_email_page_enter_6digit_verification_code, style: textTheme.bodySmall, children: [
                      TextSpan(
                        text: context.read<LoginPageCubit>().state.phonenumber,
                        style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
                      )
                    ]),
                  ),
                  const VerticallBigSpace(),
                  Image.asset("assets/images/login_verify_number.png"),
                  const VerticallBigSpace(),
                  PinCodeTextField(
                    key: const Key('emailPinfield'),
                    controller: codeController,
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        inactiveColor: Colors.grey,
                        selectedColor: colorScheme.primary,
                        borderWidth: 3,
                        activeColor: colorScheme.primary),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return context.l10n.login_page_code_required;
                      }
                      if (val.length != 6) {
                        return context.l10n.login_page_enter_valid_code;
                      }
                      return null;
                    },
                    onCompleted: (value) {
                      setState(() {
                        pinCode = value;
                      });
                    },
                    onChanged: (value) {},
                  ),
                  const VerticallBigSpace(),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonWidget(
                              key: const Key('verifyButton'),
                              onPressed: () async {
                                if (_formKeyPassword.currentState?.validate() == true) {
                                  if (pinCode == widget.verificationCode) {
                                    final user = context.read<UserBloc>().state.user;

                                    context.read<UserBloc>().add(UserEvent.userUpdated(
                                        user: User(
                                            id: user?.id ?? "",
                                            name: user?.name,
                                            phoneNo: user?.phoneNo,
                                            photoUrl: user?.photoUrl,
                                            rewardPoints: user?.rewardPoints ?? 0.0,
                                            selectedAddressId: user?.selectedAddressId,
                                            studentEmail: widget.studentEmail)));
                                    await context.read<VerifyStudentEmailPageCubit>().updateVerifyStudentUser(user!, widget.studentEmail);
                                    context.goNamed("profile_page");
                                  } else {
                                    ScaffoldMessenger.of(context)
                                      ..removeCurrentSnackBar()
                                      ..showSnackBar(SnackBar(content: Text(context.l10n.verify_student_email_page_enter_6digit_verification_code_error)));
                                  }
                                }
                              },
                              text: context.l10n.login_page_verify)),
                      const VerticallBigSpace(),
                    ],
                  ),
                  TextButton(
                      onPressed: () async {
                        var code = RandomNumber.generate();
                        // override for resend verification test
                        if (widget.studentEmail == "test@kachpara.edu.tr") {
                          code = 123456;
                        }
                        setState(() {
                          widget.verificationCode = code.toString();
                        });
                        await context.read<AddStudentEmailPageCubit>().sendVerificationToStudentEmail(widget.studentEmail, code);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(context.l10n.verify_student_email_page_resend_6digit_verification_code)));
                      },
                      child: Text(context.l10n.login_page_resend))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/home_page/home_page.dart';
import 'package:kachpara/ui/register_page/register_page.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/injector.dart';
import '../../utils/status.dart';
import 'cubit/login_page_cubit.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login_page';
  const LoginPage({super.key, this.lastRoute});
  final String? lastRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginPageCubit>(),
      child: LoginPageLayout(
        lastRoute: lastRoute,
      ),
    );
  }
}

class LoginPageLayout extends StatefulWidget {
  const LoginPageLayout({super.key, this.lastRoute});
  final String? lastRoute;

  @override
  State<LoginPageLayout> createState() => _LoginPageLayoutState();
}

class _LoginPageLayoutState extends State<LoginPageLayout> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageCubit, LoginPageState>(
      listener: (context, state) {
        if (state.loginStatus == Status.success && state.newUser == true) {
          context.pushNamed(RegisterPage.routeName);
        } else if (state.loginStatus == Status.success && state.newUser == false) {
          if (widget.lastRoute != null && widget.lastRoute != '') {
            context.go(widget.lastRoute!);
          } else {
            context.goNamed(HomePage.routeName);
          }
        }
      },
      listenWhen: (c, p) => c != p,
      builder: (context, state) {
        return Scaffold(
            body: TabBarView(controller: tabController, children: [
          EnterPhoneNoView(
            tabController: tabController,
          ),
          const VerifyPhoneNo()
        ]));
      },
    );
  }
}

class EnterPhoneNoView extends StatefulWidget {
  const EnterPhoneNoView({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<EnterPhoneNoView> createState() => _EnterPhoneNoViewState();
}

class _EnterPhoneNoViewState extends State<EnterPhoneNoView> {
  final _formKeyPhoneNo = GlobalKey<FormState>();
  late final phoneNoController = TextEditingController();
  String phoneNo = "";
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocListener<LoginPageCubit, LoginPageState>(
      listener: (context, state) {
        if (state.codeSentStatus == Status.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
            ),
          );
        } else if (state.codeSentStatus == Status.success) {
          widget.tabController.animateTo(1);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKeyPhoneNo,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.login_page_hero_title,
                    style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
                  ),
                  const VerticallSmallSpace(),
                  Text(context.l10n.login_page_hero_subtitle, style: textTheme.titleMedium),
                  const VerticallBigSpace(),
                  Image.asset("assets/images/login_phone_number.png"),
                  const VerticallBigSpace(),
                  IntlPhoneField(
                      controller: phoneNoController,
                      initialCountryCode: WidgetsBinding.instance.window.locale.countryCode,
                      validator: (val) {
                        if (val == null || val.toString().isEmpty) {
                          return context.l10n.login_page_message_phone_number_required;
                        }
                        if (!RegExp(r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$').hasMatch(val.toString())) {
                          return context.l10n.login_page_enter_valid_phone_number;
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                            phoneNo = value.completeNumber;
                          }),
                      decoration: InputDecoration(
                          prefixStyle: Theme.of(context).textTheme.bodyLarge, labelText: context.l10n.login_page_phone_no, hintText: "9946464646")),
                  const VerticallBigSpace(),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                            key: const Key('sendCodeButton'),
                            onPressed: () async {
                              if (_formKeyPhoneNo.currentState?.validate() == true) {
                                final cubit = context.read<LoginPageCubit>()..sentCode(phoneNo);
                                await cubit.stream.firstWhere((element) => element.codeSentStatus != Status.loading);
                              }
                            },
                            text: context.l10n.login_page_send_code),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyPhoneNo extends StatefulWidget {
  const VerifyPhoneNo({super.key});

  @override
  State<VerifyPhoneNo> createState() => _VerifyPhoneNoState();
}

class _VerifyPhoneNoState extends State<VerifyPhoneNo> {
  final _formKeyPassword = GlobalKey<FormState>();
  late final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final phoneNo = context.read<LoginPageCubit>().state.phonenumber;
    return Padding(
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
                  text: TextSpan(text: context.l10n.login_page_enter_6digit_verification_code, style: textTheme.bodySmall, children: [
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
                  key: const Key('pinfield'),
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
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const VerticallBigSpace(),
                Row(
                  children: [
                    Expanded(
                        child: ButtonWidget(
                            key: const Key('verifyButton'),
                            onPressed: () async {
                              if (_formKeyPassword.currentState?.validate() == true) {
                                await context.read<LoginPageCubit>().verifyCode(codeController.text);
                              }
                            },
                            text: context.l10n.login_page_verify)),
                    const VerticallBigSpace(),
                  ],
                ),
                TextButton(
                    onPressed: () async {
                      await context.read<LoginPageCubit>().resendVerificationCode(phoneNo ?? "");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.login_page_resent_sms)));
                    },
                    child: Text(context.l10n.login_page_resend))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/curation.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/loading_widget.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';

import 'bloc/referral_code_entry_page_bloc.dart';

class ReferralCodeEntryPage extends StatelessWidget {
  static const String routeName = 'referral_code_entry_page';

  const ReferralCodeEntryPage({super.key, this.code});
  final String? code;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReferralCodeEntryPageBloc>(),
      child: ReferralCodeEntryPageLayout(
        code: code,
      ),
    );
  }
}

class ReferralCodeEntryPageLayout extends StatefulWidget {
  const ReferralCodeEntryPageLayout({
    super.key,
    this.code,
  });

  final String? code;

  @override
  State<ReferralCodeEntryPageLayout> createState() => _ReferralCodeEntryPageLayoutState();
}

class _ReferralCodeEntryPageLayoutState extends State<ReferralCodeEntryPageLayout> {
  late final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.code ?? '';
    if (widget.code != null) {
      _textController.text = widget.code ?? '';
      print("referral_code_entry_page.dart: widget.code: ${widget.code}");
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReferralCodeEntryPageLayout oldWidget) {
    if (oldWidget.code != widget.code) {
      if (widget.code != null) {
        _textController.text = widget.code ?? '';

        _textController.text = widget.code ?? '';
        context.read<ReferralCodeEntryPageBloc>().add(
              ReferralCodeEntryPageEvent.entry(widget.code ?? ''),
            );
        print("referral_code_entry_page.dart: widget.code: ${widget.code}");
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReferralCodeEntryPageBloc, ReferralCodeEntryPageState>(
      listener: (context, state) {
        if (state.addStatus == Status.success) {
          context.pop();
        }
        if (state.addStatus == Status.failed && state.errorMessage != null) {
          showSnackBar(context, state.errorMessage ?? "");
        }
      },
      listenWhen: (p, c) => c.addStatus != p.addStatus,
      builder: (context, state) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(child: Align(alignment: Alignment.center, child: Text(context.l10n.referral_code_entry_page_add_store))),
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.close)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _textController,
                  maxLength: 6,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (val) {
                    if (val.length == 6) {
                      context.read<ReferralCodeEntryPageBloc>().add(ReferralCodeEntryPageEvent.entry(val));
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: (state.entryStatus == Status.loading)
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: LoadingWidget(),
                          )
                        : null,
                    labelText: context.l10n.referral_code_entry_page_hint_add_store,
                  ),
                ),
                const VerticallBigSpace(),
                if (state.curation != null) _CurationCard(curation: state.curation!),
                if (state.store != null) _StoreCard(store: state.store!),
                const VerticallBigSpace(),
                ButtonWidget(
                    key: const Key('addReferral'),
                    onPressed: (state.store == null && state.curation == null)
                        ? null
                        : () {
                            context.read<ReferralCodeEntryPageBloc>().add(const ReferralCodeEntryPageEvent.add());
                          },
                    text: context.l10n.common_button_add)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({required this.store});
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.store),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(store.name),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurationCard extends StatelessWidget {
  const _CurationCard({required this.curation});
  final Curation curation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.list),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(curation.name),
            ),
          ),
        ],
      ),
    );
  }
}

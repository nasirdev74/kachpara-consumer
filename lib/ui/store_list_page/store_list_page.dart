import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/domain/entities/curation.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/products_list_page/product_list_page.dart';

import '../../core/injector.dart';
import '../../domain/entities/store.dart';
import 'cubit/store_list_page_cubit.dart';

class StoreListPage extends StatefulWidget {
  static const String routeName = 'store_list_page';
  const StoreListPage({super.key, required this.curation});

  final Curation curation;

  @override
  State<StoreListPage> createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  late final StoreListPageCubit? _storeListPageCubit;
  @override
  void initState() {
    getasyncCubit();
    super.initState();
  }

  void getasyncCubit() async {
    _storeListPageCubit = await getIt.getAsync<StoreListPageCubit>(param1: widget.curation);
  }

  @override
  Widget build(BuildContext context) {
    return (_storeListPageCubit != null)
        ? BlocProvider(
            create: (context) => _storeListPageCubit!..setCuration(widget.curation),
            child: StoreListPageLayout(
              curation: widget.curation,
            ),
          )
        : Container();
  }
}

class StoreListPageLayout extends StatefulWidget {
  const StoreListPageLayout({
    super.key,
    required this.curation,
  });

  final Curation curation;

  @override
  State<StoreListPageLayout> createState() => _StoreListPageLayoutState();
}

class _StoreListPageLayoutState extends State<StoreListPageLayout> {
  @override
  void initState() {
    context.read<StoreListPageCubit>().getStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      context.l10n.store_list_page_curator_details,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        _CuratorDetailsSectionView(widget: widget),
                        const SizedBox(height: 20),
                        Card(
                          child: Row(
                            children: [
                              const Icon(Icons.local_offer, color: Colors.green),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(context.l10n.store_list_page_benifits),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<StoreListPageCubit, StoreListPageState>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => StoresListItem(
                    store: state.stores[index],
                  ),
                  childCount: state.stores.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CuratorDetailsSectionView extends StatelessWidget {
  const _CuratorDetailsSectionView({
    required this.widget,
  });

  final StoreListPageLayout widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/guest_profile.jpg",
          ),
          radius: 40,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.store_list_page_curator_name('name'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(widget.curation.description ??
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StoresListItem extends StatelessWidget {
  const StoresListItem({super.key, required this.store});
  final Store store;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => context.pushNamed(ProductListpage.routeName, extra: store),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              (store.imageFileName == null || store.imageFileName == '')
                  ? Image.asset(
                      'assets/images/store-placeholder.jpg',
                      width: 100,
                      height: 100,
                    )
                  : Image.network(
                      'https:${store.imageFileName}',
                      width: 100,
                      height: 100,
                    ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Text(
                    store.name,
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

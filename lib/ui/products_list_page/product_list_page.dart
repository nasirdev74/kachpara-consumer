import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/domain/entities/category.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/edit_product_page/edit_product_page.dart';
import 'package:kachpara/ui/products_list_page/cubit/product_list_page_cubit.dart';
import 'package:kachpara/ui/products_list_page/widget/add_to_cart_button.dart';
import 'package:kachpara/ui/promotions_page/promotions_page.dart';
import 'package:kachpara/utils/image_picker_utils.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/button.dart';

import '../../app/cart_bloc/cart_bloc.dart';
import '../../core/injector.dart';
import '../../domain/entities/product.dart';
import '../checkout_page/checkout_page.dart';

class ProductListpage extends StatelessWidget {
  static const String routeName = 'product_list_page';
  const ProductListpage({super.key, required this.storeId, this.referralCode, this.curationId});
  final String storeId;
  final String? referralCode;
  final String? curationId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductListPageCubit>(param1: storeId, param2: referralCode),
      child: const ProductListPageLayout(),
    );
  }
}

class ProductListPageLayout extends StatefulWidget {
  const ProductListPageLayout({
    super.key,
  });

  @override
  State<ProductListPageLayout> createState() => _ProductListPageLayoutState();
}

class _ProductListPageLayoutState extends State<ProductListPageLayout> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartBloc>().state.cart;
    final user = context.read<UserBloc>().state.user;
    return BlocBuilder<ProductListPageCubit, ProductListPageState>(
      builder: (context, state) {
        if (state.getCategoriesStatus == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // there is a case where RewardEnabled for store but store is not added
        // by user. The is when user adds a curation and navigates to product list.
        // in such a case user has no right to earn reward so we do not show
        // share and reward page. isRewardEnabled becomes false.
        bool isRewardEnabledInDB = state.store!.isRewardEnabled ?? false;
        bool isRewardEnabled = isRewardEnabledInDB && state.userStore != null;

        String? totalRewardsText;
        if (state.userStore != null) {
          totalRewardsText = state.store!.currencySymbol + state.userStore!.totalRewards.toString();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(state.store!.name),
            centerTitle: true,
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       context.pushNamed(RewardSharePage.routeName,
            //           queryParameters: {'storeId': state.store!.id.toString()});
            //     },
            //     icon: const Icon(Icons.share),
            //   ),
            // ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            if (user?.isAdmin ?? false)
                              IconButton(
                                icon: Icon(
                                  Icons.photo_camera,
                                  color: Theme.of(context).primaryColor,
                                  size: 40,
                                ),
                                onPressed: _addFromMenuImage,
                              ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  key: const Key('store_promotions'),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                                  ),
                                  onPressed: () {
                                    context.pushNamed(
                                      PromotionsPage.routeName,
                                      queryParameters: {
                                        'storeName': state.store!.name,
                                        "storeId": state.store!.id.toString(),
                                      },
                                    );
                                  },
                                  child: Text(
                                    context.l10n.product_list_page_promotions,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.product_list_page_categories,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              // Text(
                              //   key: const Key('free_promotion_counter'),
                              //   context.l10n.product_list_page_free_food_counter(promotionTitle, avalilableDonations.toString()),
                              //   style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              // ),
                              // Check if user is super admin or store admin
                              if ((user?.isAdmin ?? false) || (state.store?.adminUserIds.contains(user?.id) ?? false))
                                IconButton(
                                  onPressed: () => context.pushNamed(EditProductPage.routeName, pathParameters: {
                                    'storeId': state.store!.id.toString(),
                                  }).then((_) => context.read<ProductListPageCubit>().reloadProductListPage()),
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => CategoryListitem(
                            category: state.categories[index],
                            storeId: state.store!.id,
                            curationId: state.curationId,
                          ),
                          childCount: state.categories.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (cart != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(CheckoutPage.routeName, queryParameters: {"storeId": cart.restaurantId.toString()});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 66,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${cart.items.length} ${context.l10n.nav_bar_items}",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                  Flexible(
                                    child: Text("₺${cart.items.fold<double>(0, (acc, item) => acc + (item.quantity * (item.product.price)))}",
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                                key: const Key('viewCart'),
                                onPressed: () {
                                  context.pushNamed(CheckoutPage.routeName, queryParameters: {"storeId": cart.restaurantId.toString()});
                                },
                                child: Text(
                                  context.l10n.nav_bar_view_cart,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _addFromMenuImage() async {
    await getImage(context).then((file) {
      if (file != null) {
        final image = File(file.path);
        context.read<ProductListPageCubit>().addMenuImage(image: image);
      }
    });
  }
}

class ProductsListItem extends StatefulWidget {
  const ProductsListItem({
    super.key,
    required this.product,
    required this.storeId,
    this.curationId,
  });
  final Product product;
  final String storeId;
  final String? curationId;

  @override
  State<ProductsListItem> createState() => _ProductsListItemState();
}

class _ProductsListItemState extends State<ProductsListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffD3E8DC),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Visibility(
              visible: widget.product.imageFileName != null && widget.product.imageFileName != '',
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: (widget.product.imageFileName != null && widget.product.imageFileName != '')
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.product.imageFileName!.contains('https://') ? widget.product.imageFileName! : "https:${widget.product.imageFileName ?? ''}",
                          ),
                        )
                      : null, // Set image to null if imageFileName is null
                  color: (widget.product.imageFileName != null && widget.product.imageFileName != '')
                      ? null
                      : Colors.transparent, // Set color to transparent if imageFileName is null
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                              Text("₺" + widget.product.price.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                              Text(widget.product.description!, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        AddToCartButton(
                          product: widget.product,
                          storeId: widget.storeId,
                          curationId: widget.curationId,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.add_circle,
            //       size: 30,
            //       color: Theme.of(context).primaryColor,
            //     ))
          ],
        ),
      ),
    );
  }
}

class CategoryListitem extends StatefulWidget {
  const CategoryListitem({super.key, required this.category, required this.storeId, this.curationId});
  final Category category;
  final String storeId;
  final String? curationId;

  @override
  State<CategoryListitem> createState() => _CategoryListitemState();
}

class _CategoryListitemState extends State<CategoryListitem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserBloc>().state.user;
    final isSelected = context.select<ProductListPageCubit, int?>(((value) => value.state.selectedCategoryId));

    return InkWell(
      key: Key("category-${widget.category.id}"),
      onTap: () {
        // context.read<ProductListPageCubit>().changeCategory(widget.category.id);
        setState(() {
          expanded = !expanded;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color(0xffF2F2F2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: widget.category.products.isNotEmpty &&
                              widget.category.products[0].imageFileName != null &&
                              widget.category.products[0].imageFileName != ''
                          ? Image.network(
                              widget.category.products[0].imageFileName!.contains('https://')
                                  ? widget.category.products[0].imageFileName!
                                  : "https:${widget.category.products[0].imageFileName ?? ''}",
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.arrow_downward,
                              color: Colors.black, // Adjust the color as needed
                              size: 16, // Adjust the size as needed
                            ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.category.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  if ((user?.isAdmin ?? false) || (context.read<ProductListPageCubit>().state.store?.adminUserIds.contains(user?.id) ?? false)) ...[
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.pushNamed(EditProductPage.routeName, extra: widget.category, pathParameters: {
                          'storeId': widget.storeId,
                        }).then((_) => context.read<ProductListPageCubit>().reloadProductListPage());
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ]
                ],
              ),
              if (expanded)
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.category.products.length,
                      itemBuilder: (context, index) {
                        return ProductsListItem(
                          product: widget.category.products[index],
                          storeId: widget.storeId,
                          curationId: widget.curationId,
                        );
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

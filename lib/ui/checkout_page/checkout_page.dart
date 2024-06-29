import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as datetime;
import 'package:kachpara/app/cart_bloc/cart_bloc.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/order_success_page/order_success_page.dart';
import 'package:kachpara/ui/payment_methods_page/payment_methods_page.dart';
import 'package:kachpara/ui/products_list_page/product_list_page.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:kachpara/widgets/snackbar.dart';

import '../../core/router.dart';
import '../../domain/entities/address.dart';
import '../../utils/status.dart';
import '../../widgets/button.dart';
import '../address_list_page/address_list_page.dart';
import 'cubit/checkout_page_cubit.dart';
import 'widget/receivingTime_selection.dart';

class CheckoutPage extends StatelessWidget {
  static const String routeName = "checkout_page";
  const CheckoutPage({super.key, required this.storeId});

  final String storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<CheckoutPageCubit>(param1: storeId), child: const _CheckoutPageLayout());
  }
}

class _CheckoutPageLayout extends StatelessWidget {
  const _CheckoutPageLayout();

  //// 3:00 AM the next day
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startTime = DateTime(now.year, now.month, now.day, 13, 0); // 1:00 PM
    final endTime = DateTime(now.year, now.month, now.day, 3, 0).add(const Duration(days: 1));
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.checkout_page_checkout),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              tooltip: context.l10n.checkout_page_delete_cart,
              icon: Icon(Icons.delete),
              onPressed: () {
                // Handle the tap on the shopping cart icon
                context.read<CartBloc>().add(const CartEvent.clearCart());
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const _PickupDeliverySwitch(),
                const _AddressSection(),
                ReceivingTimeSelection(
                  openingTime: startTime,
                  closingTime: endTime,
                ),
                const _AdditionalNotes(),
                const _OrdersSection(),
                const _CalculationSection(),
                // const _UserRewardsPointsSection(),
                const _SavedCardssection(),
                _PlaceOrderButton()
              ])),
            ]),
          ),
        ));
  }
}

class _PickupDeliverySwitch extends StatelessWidget {
  const _PickupDeliverySwitch();

  @override
  Widget build(BuildContext context) {
    bool isDelivery = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.isDelivery);
    bool donationOnly = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.donationOnly);
    if (donationOnly) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          context.l10n.checkout_page_pickup,
          style: TextStyle(color: isDelivery ? Colors.black : Theme.of(context).primaryColor, fontWeight: FontWeight.w500),
        ),
        CupertinoSwitch(
          value: isDelivery,
          onChanged: (value) {
            context.read<CheckoutPageCubit>().isdeliveryChange(value);
          },
          thumbColor: Theme.of(context).primaryColor,
          trackColor: const Color.fromARGB(255, 232, 221, 221),
          activeColor: const Color.fromARGB(255, 232, 221, 221),
        ),
        Text(
          context.l10n.checkout_page_delivery,
          style: TextStyle(color: isDelivery ? Theme.of(context).primaryColor : Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class _CalculationSection extends StatelessWidget {
  const _CalculationSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
        builder: (context, state) {
          if (state.checkoutStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          final currencySymbol = state.store!.currencySymbol;
          double? minAmount = 0;
          double? discountAmount = 0;
          String promotionText = "";

          if (state.promotion != null) {
            minAmount = state.promotion?.minimumPurchaseAmount;
            discountAmount = state.promotion?.discountAmount;
            promotionText = context.l10n.checkout_page_promotion_text(currencySymbol, discountAmount!.toString(), minAmount!.toString());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.promotion != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.checkout_page_subtotal, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                    Text("$currencySymbol${state.subTotal}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              if (state.promotion != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.checkout_page_discount, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                    Text("-$currencySymbol${state.discount}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              // promotion applied, green alert
              if (state.promotion != null && state.subTotal > minAmount)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Text(promotionText, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green, fontSize: 12)),
                    ),
                  ],
                ),
              // promotion not applied, red alert
              if (state.promotion != null && state.subTotal <= minAmount)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Text(promotionText, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red, fontSize: 12)),
                    ),
                  ],
                ),
              if (state.useRewardPoints == true)
                Builder(builder: (context) {
                  final balance = context.select<CheckoutPageCubit, double>((value) => value.state.balance);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.checkout_page_reward_point, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                      Text("-$currencySymbol$balance", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  );
                }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.l10n.checkout_page_total, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                  Text("$currencySymbol${state.total}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OrdersSection extends StatelessWidget {
  const _OrdersSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.l10n.checkout_page_orders,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.pushNamed(
                    ProductListpage.routeName,
                    queryParameters: {"storeId": context.read<CartBloc>().state.cart?.restaurantId.toString()},
                  );
                },
                child: Row(
                  children: [
                    Text(
                      context.l10n.checkout_page_go_to_menu,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.menu_book),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BlocSelector<CartBloc, CartState, List<CartItem>>(
            selector: (state) {
              return state.cart?.items ?? [];
            },
            builder: (context, cartItems) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: ((context, index) {
                    return _OrderItem(
                      cartItem: cartItems[index],
                      length: cartItems.length,
                      index: index,
                    );
                  }));
            },
          )
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    required this.cartItem,
    required this.length,
    required this.index,
  });

  final CartItem cartItem;
  final int length;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), extentRatio: .3, children: [
          SlidableAction(
            label: context.l10n.common_button_delete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (length == 1)
                ? ((scontext) async {
                    final result = await showDialog(
                        context: scontext,
                        builder: (dcontext) {
                          return AlertDialog(
                            content: Text(context.l10n.checkout_page_message_removing_item),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 40),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(dcontext, true);
                                  },
                                  child: Text(context.l10n.common_button_yes)),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40), fixedSize: const Size(100, 40)),
                                  onPressed: () {
                                    Navigator.pop(dcontext, false);
                                  },
                                  child: Text(context.l10n.common_button_no))
                            ],
                          );
                        });
                    if (result) {
                      context.read<CartBloc>().add(const CartEvent.clearCart());
                      Navigator.pop(context);
                    }
                  })
                : (context) {
                    context.read<CartBloc>().add(CartEvent.removeFromCart(cartItem.id));
                  },
          ),
        ]),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.grey[200],
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: _hasImage() ? Theme.of(context).primaryColor : null,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: _getImageProvider(), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(cartItem.product.priceWithSign ?? ""),
                      Text(context.l10n.checkout_page_quantity(cartItem.quantity)),
                    ],
                  ),
                ),
                QuantityChanger(
                  cartItem: cartItem,
                  length: length,
                  index: index,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _hasImage() {
    return (cartItem.product.imageFileName != null && cartItem.product.imageFileName!.isNotEmpty);
  }

  ImageProvider<Object> _getImageProvider() {
    if (_hasImage()) {
      return NetworkImage("https:${cartItem.product.imageFileName!}");
    } else {
      return const AssetImage("assets/images/product.png");
    }
  }
}

class QuantityChanger extends StatelessWidget {
  const QuantityChanger({
    super.key,
    required this.cartItem,
    required this.length,
    required this.index,
  });

  final CartItem cartItem;
  final int length;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(31.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              (cartItem.quantity == 1)
                  ? BlocSelector<CartBloc, CartState, Status>(
                      selector: (state) {
                        return state.removeFromCartStatus;
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: state == Status.loading
                              ? null
                              : length == 1
                                  ? () async {
                                      final result = await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(context.l10n.checkout_page_message_removing_item),
                                              actions: [
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      minimumSize: const Size(100, 40),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context, true);
                                                    },
                                                    child: Text(context.l10n.common_button_yes)),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40), fixedSize: const Size(100, 40)),
                                                    onPressed: () {
                                                      Navigator.pop(context, false);
                                                    },
                                                    child: Text(context.l10n.common_button_no))
                                              ],
                                            );
                                          });
                                      if (result) {
                                        context.read<CartBloc>().add(const CartEvent.clearCart());
                                        Navigator.pop(context);
                                      }
                                    }
                                  : () {
                                      context.read<CartBloc>().add(CartEvent.removeFromCart(cartItem.id));
                                    },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: state == Status.loading
                                ? Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                                  )
                                : Icon(Icons.delete, color: Theme.of(context).primaryColor),
                          ),
                        );
                      },
                    )
                  : BlocBuilder<CartBloc, CartState>(
                      buildWhen: (previous, current) {
                        return previous.decreaseQuantityStatus != current.decreaseQuantityStatus;
                      },
                      builder: (context, bloc) {
                        final state = bloc.decreaseQuantityStatus;
                        return InkWell(
                          onTap: state == Status.loading
                              ? null
                              : () {
                                  context.read<CartBloc>().add(CartEvent.decreaseQuantity(cartItem.id));
                                },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: state == Status.loading && bloc.updatingCartItemId == cartItem.id
                                ? Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                                  )
                                : Icon(Icons.remove, color: Theme.of(context).primaryColor),
                          ),
                        );
                      },
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  cartItem.quantity.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                buildWhen: (previous, current) {
                  return previous.increaseQuantityStatus != current.increaseQuantityStatus;
                },
                builder: (context, bc) {
                  final state = bc.increaseQuantityStatus;

                  return InkWell(
                    onTap: state == Status.loading
                        ? null
                        : () {
                            context.read<CartBloc>().add(CartEvent.incrementQuantity(cartItem.id));
                          },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: state == Status.loading && bc.updatingCartItemId == cartItem.id
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                            )
                          : Icon(Icons.add, color: Theme.of(context).primaryColor),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class _AdditionalNotes extends StatefulWidget {
  const _AdditionalNotes();

  @override
  State<_AdditionalNotes> createState() => _AdditionalNotesState();
}

class _AdditionalNotesState extends State<_AdditionalNotes> {
  late final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notes = context.select<CheckoutPageCubit, String?>((cubit) => cubit.state.note);
    bool donationOnly = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.donationOnly);

    if (donationOnly) return const SizedBox.shrink();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            context.l10n.checkout_page_additional_notes,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const VerticallSmallSpace(),
          (notes != null)
              ? Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(notes),
                        ),
                      ),
                    ],
                  ),
                )
              : TextButton(
                  onPressed: () {
                    _showAdditionalNotesDialog(context);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(context.l10n.checkout_page_add_note)
                    ],
                  )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void _showAdditionalNotesDialog(BuildContext parentContext) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(context.l10n.checkout_page_additional_notes),
            content: TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(border: const OutlineInputBorder(), hintText: context.l10n.checkout_page_enter_additional_notes),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(context.l10n.common_button_cancel)),
              TextButton(
                  onPressed: () {
                    parentContext.read<CheckoutPageCubit>().noteChanged(_controller.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(context.l10n.common_button_save)),
            ],
          );
        });
  }
}

class _AddressSection extends StatefulWidget {
  const _AddressSection();
  @override
  State<_AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<_AddressSection> with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppRouter.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool donationOnly = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.donationOnly);

    if (donationOnly) return const SizedBox.shrink();

    bool isDelivery = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.isDelivery);

    final address = context.select<SelectedItemsBloc, Address?>(
      (value) => value.state.selectedAddress,
    );

    final addressText = address?.address ?? context.l10n.profile_page_address_text;
    return BlocBuilder<CheckoutPageCubit, CheckoutPageState>(
      builder: (context, state) {
        if (state.checkoutStatus == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return InkWell(
          key: const Key("address_list"),
          onTap: () {
            isDelivery ? context.pushNamed(AddressListPage.routeName) : null;
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
                    Text(isDelivery ? context.l10n.checkout_page_delivery_address : context.l10n.checkout_page_pickup_address,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    isDelivery
                        ? Text(addressText,
                            // overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15))
                        : SizedBox(
                            width: 280,
                            child: Text(state.store!.address,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.justify,
                                // overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15)),
                          ),
                  ],
                ),
                isDelivery
                    ? const Icon(
                        CupertinoIcons.forward,
                        color: Colors.black54,
                      )
                    : const SizedBox.shrink(),
              ],
            )),
          ),
        );
      },
    );
  }
}

class _PlaceOrderButton extends StatelessWidget {
  _PlaceOrderButton();
  final datetime.DateFormat _timeFormat = datetime.DateFormat('HH:mm');
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    //placeholders
    final startTime = DateTime(now.year, now.month, now.day, 13, 0); // 1:00 PM
    final endTime = DateTime(now.year, now.month, now.day, 3, 0).add(const Duration(days: 1));
    final receivingfoodTime = context.select<CheckoutPageCubit, DateTime?>((cubit) => cubit.state.receivingfoodTime);

    return BlocListener<CheckoutPageCubit, CheckoutPageState>(
      listener: (context, state) async {
        if (state.checkoutStatus == Status.success && state.orderId != null) {
          context.goNamed(OrderSuccessPage.routeName, pathParameters: {"orderId": state.orderId ?? ""});
        } else if (state.checkoutStatus == Status.failed) {
          showSnackBar(context, state.checkoutError ?? context.l10n.checkout_page_message_checkout_failed);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ButtonWidget(
            key: const Key("placeOrder"),
            onPressed: () async {
              await context.read<CheckoutPageCubit>().checkout();
            },
            text: context.l10n.checkout_page_place_order),
      ),
    );
  }
}

class _SavedCardssection extends StatelessWidget {
  const _SavedCardssection();
  @override
  Widget build(BuildContext context) {
    final paymentMethod = context.select<SelectedItemsBloc, PaymentCard?>(
      (value) => value.state.selectedPaymentMethod,
    );
    final paymentMethodText = paymentMethod?.last4 ?? context.l10n.checkout_page_add_payment_method;
    return InkWell(
      key: const Key("payment_methods_list"),
      onTap: () {
        context.pushNamed(PaymentMethodsPage.routeName);
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
                Text(context.l10n.checkout_page_payment_methods, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(paymentMethodText, style: const TextStyle(fontSize: 15))
              ],
            ),
            const Icon(
              CupertinoIcons.forward,
              color: Colors.black54,
            )
          ],
        )),
      ),
    );
  }
}

class _UserRewardsPointsSection extends StatelessWidget {
  const _UserRewardsPointsSection();

  @override
  Widget build(BuildContext context) {
    // int storeId =
    //     context.select<CheckoutPageCubit, int>((cubit) => cubit.state.storeId);
    // final store = getIt<StoreBloc>()
    //     .state
    //     .stores
    //     .firstWhere((element) => element.id == storeId);
    final balance = context.select<CheckoutPageCubit, double>((value) => value.state.balance);
    // query reward balance
    if (balance == 0) {
      return const SizedBox();
    }
    final total = context.select<CheckoutPageCubit, double>((value) => value.state.subTotal);
    if (total < 20) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticallSmallSpace(),
        BlocSelector<CheckoutPageCubit, CheckoutPageState, bool>(
            selector: (state) => state.useRewardPoints,
            builder: (context, useRewardPoints) {
              return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: useRewardPoints,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<CheckoutPageCubit>().useRewardPointsChanged(value);
                    }
                  },
                  title: Text(context.l10n.checkout_page_use_rewards_points("store.currencySymbol", balance)));
            })
      ],
    );
  }
}

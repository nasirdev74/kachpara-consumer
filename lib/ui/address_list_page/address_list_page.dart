import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/address_list_page/cubit/address_list_page_cubit.dart';

import '../../core/router.dart';
import '../../domain/entities/address.dart';
import '../../utils/status.dart';
import '../add_address_page/add_address_page.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  static const routeName = 'address_list_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<AddressListPageCubit>(), child: const AddressListPageLayout());
  }
}

class AddressListPageLayout extends StatefulWidget {
  const AddressListPageLayout({super.key});

  @override
  State<AddressListPageLayout> createState() => _AddressListPageLayoutState();
}

class _AddressListPageLayoutState extends State<AddressListPageLayout> with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppRouter.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    context.read<AddressListPageCubit>().getAddresses();
    super.initState();
  }

  @override
  void didPopNext() {
    context.read<AddressListPageCubit>().getAddresses();
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    final selectedAddress = context.select<SelectedItemsBloc, Address?>(
      (value) => value.state.selectedAddress,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.address_list_page_choose_adress),
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            key: const Key("addAddressPage"),
            onPressed: () {
              context.pushNamed(AddAddressPage.routeName);
            },
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: BlocBuilder<AddressListPageCubit, AddressListPageState>(builder: (context, state) {
            if (state.getAddressesStatus == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.getAddressesStatus == Status.failed) {
              return Center(
                  child: Text(
                context.l10n.profile_page_error(state.getAddressesErrorMessage!),
              ));
            }
            if (state.addresses.isEmpty) {
              return Center(
                child: Text(context.l10n.profile_page_no_address_found),
              );
            }
            return ListView.builder(
                itemCount: state.addresses.length,
                itemBuilder: ((context, index) {
                  return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: .4,
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (ctx) {
                              ctx.pushNamed(AddAddressPage.routeName, extra: state.addresses[index]);
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                          SlidableAction(
                            onPressed: (ctx) async {
                              if (state.addresses[index] != selectedAddress) {
                                showConfirmationDialog(context, state.addresses[index]);
                              } else {
                                showConfirmationDefaultDeleteDialog(context, state.addresses[index]);
                              }
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                          key: const Key("setDefaultAddress"),
                          leading: state.addresses[index].id == selectedAddress?.id
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green[700],
                                )
                              : const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.grey,
                                ),
                          title: Text(
                            state.addresses[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(state.addresses[index].address),
                          shape: const Border(
                            bottom: BorderSide(),
                          ),
                          onTap: () async {
                            await context.read<AddressListPageCubit>().setSelectedAddress(state.addresses[index]);
                          }));
                }));
          }))
        ],
      ),
    );
  }

  showConfirmationDialog(BuildContext context, Address address) {
    showDialog(
        context: context,
        builder: ((dContext) => AlertDialog(
              content: Text("Are you sure to delete address ${address.name}?"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      await context.read<AddressListPageCubit>().deleteAddress(address);
                      Navigator.pop(dContext);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                    child: const Text("ok")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dContext);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                    child: const Text("cancel"))
              ],
            )));
  }

  showConfirmationDefaultDeleteDialog(BuildContext context, Address address) {
    showDialog(
        context: context,
        builder: ((dContext) => AlertDialog(
              content: const Text("Please change the default address before to delete"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(dContext);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                    child: const Text("ok")),
              ],
            )));
  }
}

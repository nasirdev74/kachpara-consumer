import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/models/store_model.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/edit_product_page/edit_product_page.dart';
import 'package:kachpara/ui/store_details_page/cubit/store_details_page_cubit.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/button.dart';

class StoreDetailsPage extends StatelessWidget {
  static const routeName = 'store_details_page';
  const StoreDetailsPage({required this.storeId, super.key});

  final String storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoreDetailsPageCubit>(param1: storeId)..getStoreDetailsById(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.store_details_page_title),
        ),
        body: SafeArea(
          child: BlocBuilder<StoreDetailsPageCubit, StoreDetailsPageState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == Status.failed) {
                return Center(
                  child: Text(context.l10n.store_details_page_something_went_wrong),
                );
              }

              if (state.status == Status.success && state.store == null) {
                return Center(
                  child: Text(context.l10n.store_details_page_store_not_found),
                );
              }

              final store = state.store!;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (store.lat != null && store.lng != null)
                        _StoreLocationWidget(
                          storeName: store.name,
                          location: LatLng(
                            double.parse(store.lat!),
                            double.parse(store.lng!),
                          ),
                        ),
                      _StoreProperty(
                        propertyName: context.l10n.store_details_page_name,
                        value: store.name,
                      ),
                      _StoreProperty(
                        propertyName: context.l10n.store_details_page_address,
                        value: store.address,
                      ),
                      _RedirectButton(
                        text: context.l10n.store_details_page_products,
                        onTap: () => context.pushNamed(
                          'details_product_list_page',
                          queryParameters: {
                            "storeId": storeId,
                          },
                        ),
                      ),
                      _RedirectButton(
                        text: context.l10n.store_details_page_rewards,
                        onTap: () => context.pushNamed(
                          'details_rewards_share_page_route',
                          queryParameters: {
                            "storeId": storeId,
                          },
                        ),
                      ),
                      _RedirectButton(
                        text: context.l10n.store_details_page_loyalty,
                        onTap: () => context.pushNamed(
                          'details_loyalty_page',
                          queryParameters: {
                            "storeId": storeId,
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      StoreDetailsEditor(
                        store: state.store!,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class StoreDetailsEditor extends StatefulWidget {
  const StoreDetailsEditor({required this.store, super.key});

  final Store store;

  @override
  State<StoreDetailsEditor> createState() => _StoreDetailsEditorState();
}

class _StoreDetailsEditorState extends State<StoreDetailsEditor> {
  late final isEnabled = context.read<UserBloc>().state.user?.isAdmin ?? false;

  final _currencyController = TextEditingController();
  final _currencySymbolController = TextEditingController();
  final _firstPurchaseRewardController = TextEditingController();
  final _storeUrlController = TextEditingController();
  final _facebookLinkController = TextEditingController();
  final _twitterLinkController = TextEditingController();
  final _youtubeLinkController = TextEditingController();
  final _whatsAppNumberController = TextEditingController();
  bool _isLoyaltyEnabled = false;
  bool _isKachparaEnabled = false;
  bool _isRewardEnabled = false;

  @override
  void initState() {
    super.initState();
    _currencyController.text = widget.store.currency;
    _currencySymbolController.text = widget.store.currencySymbol;
    _firstPurchaseRewardController.text = widget.store.firstPurchaseReward?.toString() ?? '';
    _storeUrlController.text = widget.store.storeUrl;
    _facebookLinkController.text = widget.store.facebookUrl ?? '';
    _twitterLinkController.text = widget.store.twitterUrl ?? '';
    _youtubeLinkController.text = widget.store.youtubeUrl ?? '';
    _whatsAppNumberController.text = widget.store.whatsapp ?? '';
    _isLoyaltyEnabled = widget.store.isLoyaltyEnabled ?? false;
    _isKachparaEnabled = widget.store.kachparaEnabled ?? false;
    _isRewardEnabled = widget.store.isRewardEnabled ?? false;
  }

  @override
  void dispose() {
    _currencyController.dispose();
    _currencySymbolController.dispose();
    _firstPurchaseRewardController.dispose();
    _storeUrlController.dispose();
    _facebookLinkController.dispose();
    _twitterLinkController.dispose();
    _youtubeLinkController.dispose();
    _whatsAppNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        InputField(
          fieldController: _currencyController,
          hintText: 'Currency',
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _currencySymbolController,
          hintText: 'Currency Symbol',
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _firstPurchaseRewardController,
          hintText: 'First Purchase Reward',
          keyboardType: TextInputType.number,
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _storeUrlController,
          hintText: 'Store link',
          keyboardType: TextInputType.url,
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _facebookLinkController,
          hintText: 'Facebook link',
          keyboardType: TextInputType.url,
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _twitterLinkController,
          hintText: 'Twitter link',
          keyboardType: TextInputType.url,
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _youtubeLinkController,
          hintText: 'YouTube link',
          keyboardType: TextInputType.url,
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        InputField(
          fieldController: _whatsAppNumberController,
          hintText: 'Whatsapp phone number',
          keyboardType: TextInputType.phone,
          isEnabled: isEnabled,
        ),
        const SizedBox(height: 8),
        if (isEnabled) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Loyalty enabled',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Switch.adaptive(
                value: _isLoyaltyEnabled,
                onChanged: ((value) {
                  setState(() {
                    _isLoyaltyEnabled = value;
                  });
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kachpara enabled',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Switch.adaptive(
                value: _isKachparaEnabled,
                onChanged: ((value) {
                  setState(() {
                    _isKachparaEnabled = value;
                  });
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reward enabled',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Switch.adaptive(
                value: _isRewardEnabled,
                onChanged: ((value) {
                  setState(() {
                    _isRewardEnabled = value;
                  });
                }),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: ButtonWidget(
              text: 'Save',
              onPressed: _saveStoreDetails,
              options: const FFButtonOptions(
                borderRadius: 8,
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _saveStoreDetails() {
    FocusManager.instance.primaryFocus?.unfocus();

    context.read<StoreDetailsPageCubit>().updateStoreData(
          store: StoreModel.fromDomain(widget.store).copyWith(
            currency: _currencyController.text.isEmpty ? widget.store.currency : _currencyController.text,
            currencySymbol: _currencySymbolController.text.isEmpty ? widget.store.currencySymbol : _currencySymbolController.text,
            firstPurchaseReward: _firstPurchaseRewardController.text.isEmpty
                ? widget.store.firstPurchaseReward
                : int.tryParse(_firstPurchaseRewardController.text) ?? widget.store.firstPurchaseReward,
            storeUrl: _storeUrlController.text.isEmpty ? widget.store.storeUrl : _storeUrlController.text,
            facebook: _facebookLinkController.text.isEmpty ? widget.store.facebookUrl : _facebookLinkController.text,
            twitter: _twitterLinkController.text.isEmpty ? widget.store.twitterUrl : _twitterLinkController.text,
            youtube: _youtubeLinkController.text.isEmpty ? widget.store.youtubeUrl : _youtubeLinkController.text,
            whatsapp: _whatsAppNumberController.text.isEmpty ? widget.store.whatsapp : _whatsAppNumberController.text,
            isLoyaltyEnabled: _isLoyaltyEnabled,
            kachparaEnabled: _isKachparaEnabled,
            isRewardEnabled: _isRewardEnabled,
          ),
        );
  }
}

class _StoreLocationWidget extends StatelessWidget {
  const _StoreLocationWidget({required this.storeName, required this.location});

  final String storeName;
  final LatLng location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        'details_store_from_map_detail_page',
        queryParameters: {
          'name': storeName,
          'lat': location.latitude.toString(),
          'lng': location.longitude.toString(),
        },
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: AbsorbPointer(
            absorbing: true,
            child: GoogleMap(
              markers: {
                Marker(
                  markerId: const MarkerId('store-location'),
                  position: location,
                ),
              },
              initialCameraPosition: CameraPosition(
                target: location,
                zoom: 12,
              ),
              myLocationButtonEnabled: false,
            ),
          ),
        ),
      ),
    );
  }
}

class _StoreProperty extends StatelessWidget {
  const _StoreProperty({
    required this.propertyName,
    required this.value,
  });

  final String propertyName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            propertyName,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade700,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

class _RedirectButton extends StatelessWidget {
  const _RedirectButton({
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/google_map_page/cubit/google_map_cubit.dart';
import 'package:kachpara/widgets/button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController searchLocationTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GoogleMapCubit mapCubit = context.read<GoogleMapCubit>()..startmap();
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<GoogleMapCubit, GoogleMapState>(
            buildWhen: (previous, current) => current is MapState,
            builder: (context, state) {
              return GoogleMap(
                compassEnabled: false,
                myLocationButtonEnabled: false,
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: mapCubit.onMapCreated,
                onCameraIdle: () {
                  setState(() {});
                },
                markers: {
                  Marker(
                    markerId: MarkerId(mapCubit.cameralatlong.toString()),
                    position: LatLng(mapCubit.cameralatlong.latitude, mapCubit.cameralatlong.longitude),
                    infoWindow: InfoWindow(title: mapCubit.placeDetail?.result.name),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: mapCubit.cameralatlong,
                  zoom: 13,
                ),
              );
            },
          ),
          BlocBuilder<GoogleMapCubit, GoogleMapState>(
            builder: (context, state) {
              return searchBar(context, state);
            },
          ),
          BlocBuilder<GoogleMapCubit, GoogleMapState>(
            builder: (context, state) {
              final GoogleMapCubit mapCubit = context.read<GoogleMapCubit>();
              if (mapCubit.placeDetail != null) {
                return Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.l10n.google_map_page_address, style: const TextStyle(fontWeight: FontWeight.w700)),
                                    Flexible(child: Text(mapCubit.placeDetail!.result.formattedAddress ?? "")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ButtonWidget(
                              onPressed: () async {
                                await mapCubit.saveAddressInStore(context);
                              },
                              text: context.l10n.common_button_save),
                        ],
                      ),
                    ));
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget searchBar(BuildContext context, GoogleMapState state) {
    final GoogleMapCubit mapCubit = context.read<GoogleMapCubit>();
    return Positioned(
      top: 15,
      left: 16,
      right: 16,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                  Expanded(
                    child: TextFormField(
                      controller: searchLocationTC,
                      decoration: InputDecoration(
                          hintText: context.l10n.google_map_page_search,
                          suffixIcon: state is AddressLoading?
                              ? const SizedBox(height: 10, width: 10, child: Center(child: CircularProgressIndicator()))
                              : searchLocationTC.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        searchLocationTC.text = "";
                                      },
                                    )
                                  : const Icon(Icons.search),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                      onChanged: (val) {
                        mapCubit.searchLocation(val);
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (state is AddressLoaded) ...[
              Container(
                decoration: BoxDecoration(color: Colors.lightGreen.shade100, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ...(state).predictionList.map(
                          (e) => ListTile(
                            dense: true,
                            title: Text(e.description ?? ""),
                            onTap: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              await mapCubit.getLatLngFromAddress(e);

                              searchLocationTC.text = e.description ?? "";
                            },
                          ),
                        ),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

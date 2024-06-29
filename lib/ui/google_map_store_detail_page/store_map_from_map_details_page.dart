import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreFromMapDetailPage extends StatefulWidget {
  static const String routeName = 'store_from_map_detail_page';
  final String name;
  final String lat;
  final String lng;

  const StoreFromMapDetailPage({super.key, required this.name, required this.lat, required this.lng});

  @override
  State<StoreFromMapDetailPage> createState() => _StoreFromMapDetailPageState();
}

class _StoreFromMapDetailPageState extends State<StoreFromMapDetailPage> {
  @override
  Widget build(BuildContext context) {
    final position = LatLng(double.parse(widget.lat), double.parse(widget.lng));
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            compassEnabled: false,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: position,
                    zoom: 13.0,
                  ),
                ),
              );
            },
            onCameraIdle: () {
              setState(() {});
            },
            markers: {
              Marker(
                markerId: MarkerId(position.toString()),
                position: position,
                infoWindow: InfoWindow(title: widget.name),
              ),
            },
            initialCameraPosition: CameraPosition(
              target: position,
              zoom: 13,
            ),
          ),
          Positioned(
            top: 15,
            left: 20,
            right: 16,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

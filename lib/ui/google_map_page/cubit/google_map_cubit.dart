// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:permission_handler/permission_handler.dart';

part 'google_map_state.dart';

@injectable
class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit(this._storeUsecase) : super(MapInitial());

  void updateMap(double lat, double lng) {
    emit(MapLoaded(lat: lat, lng: lng));
  }

  void startmap() {
    updateMap(cameralatlong.latitude, cameralatlong.latitude);
  }

  Completer<GoogleMapController> mapCompleter = Completer();

  late GoogleMapController mapController;
  PlacesDetailsResponse? placeDetail;
  final StoreUsecase _storeUsecase;

  LatLng cameralatlong = const LatLng(28.7040592, 77.10249019999999);

  void onMapCreated(controller) async {
    if (!mapCompleter.isCompleted) {
      mapCompleter.complete(controller);
    }
    setCurrentLocation();
    mapController = controller;
  }

  void setCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever || permission == LocationPermission.unableToDetermine) {
      LocationPermission permission1 = await Geolocator.requestPermission();
      if (permission1 == LocationPermission.denied || permission1 == LocationPermission.deniedForever || permission1 == LocationPermission.unableToDetermine) {
        await openAppSettings();
      }
    }
    var pos = await Geolocator.getCurrentPosition();
    cameralatlong = LatLng(pos.latitude, pos.longitude);
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(pos.latitude, pos.longitude),
          zoom: 13.0,
        ),
      ),
    );
    // }
  }

  Future<void> searchLocation(String text) async {
    List<Prediction> predictionList = [];
    if (text.isNotEmpty) {
      emit(AddressLoading());
      try {
        var location = "&location=${cameralatlong.latitude},${cameralatlong.longitude}";
        http.Response response = await http.get(Uri.parse(
            'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&types=restaurant$location&radius=30000&key=API_KEY'));
        var data = jsonDecode(response.body.toString());
        print(data);
        print("my status is " + data["status"]);
        if (data['status'] == 'OK') {
          predictionList.clear();
          data['predictions'].forEach((prediction) => predictionList.add(Prediction.fromJson(prediction)));
        } else {
          // ApiChecker.checkApi(response);
        }
      } catch (e) {}
    } else {
      predictionList.clear();
    }
    print(predictionList.length);
    emit(AddressLoaded(predictionList: predictionList));
  }

  Future<LatLng> getLatLngFromAddress(Prediction e) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: "API_KEY");
    placeDetail = await places.getDetailsByPlaceId(e.placeId ?? "");
    var latitude = placeDetail!.result.geometry?.location.lat ?? 0.0;
    var longitude = placeDetail!.result.geometry?.location.lng ?? 0.0;
    cameralatlong = LatLng(latitude, longitude);
    mapController.animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
    // selectedAddress = SelectedAddressModel(address: e, lat: latitude, long: longitude);
    updateMap(latitude, longitude);
    return LatLng(latitude, longitude);
  }

  String generateRandomCode() {
    var random = Random();
    const String chars = 'ABCDEFGHJKLMNPRSTUVYZ0123456789';
    String randomCode = '';

    for (var i = 0; i < 6; i++) {
      randomCode += chars[random.nextInt(chars.length)];
    }

    return randomCode;
  }

  Future<void> saveAddressInStore(BuildContext context) async {
    try {
      final finalReferralCode = generateRandomCode();
      final result = await _storeUsecase.getStoreByPlaceId(placeDetail!.result.placeId);
      result.when(
        success: (data) async {
          await saveStoreInUserCollection(data);
          Navigator.pop(context, true);
        },
        error: (message) async {
          final mainStoreResult = await _storeUsecase.addMainStore(
            store: Store(
              address: placeDetail!.result.formattedAddress ?? "",
              id: "",
              currency: 'TRY',
              currencySymbol: '₺',
              name: placeDetail!.result.name,
              referralCode: finalReferralCode,
              kachparaEnabled: false,
              storeUrl: "",
              googleMapsUrl: placeDetail!.result.url ?? "",
              lat: placeDetail!.result.geometry?.location.lat.toString(),
              lng: placeDetail!.result.geometry?.location.lng.toString(),
              placeId: placeDetail!.result.placeId,
            ),
          );
          mainStoreResult.when(
            success: (data) async {
              await _storeUsecase.addStore(
                store: Store(
                    id: data.id,
                    address: data.address,
                    currency: data.currency,
                    currencySymbol: data.currencySymbol,
                    name: data.name,
                    referralCode: data.referralCode,
                    storeUrl: data.storeUrl,
                    googleMapsUrl: placeDetail!.result.url ?? "",
                    kachparaEnabled: false),
                referralCode: data.referralCode,
              );
              Navigator.pop(context, true);
            },
            error: (message) => (throw Exception(message)),
          );
        },
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print("addstore catched error : $e");
      }
    }
  }

  Future<void> saveStoreInUserCollection(Store data) async {
    await _storeUsecase.addStore(
        store: Store(
            id: data.id,
            address: data.address,
            currency: data.currency,
            currencySymbol: data.currencySymbol,
            name: data.name,
            referralCode: data.referralCode,
            storeUrl: data.storeUrl,
            googleMapsUrl: data.googleMapsUrl,
            kachparaEnabled: false),
        referralCode: data.referralCode);
  }
}

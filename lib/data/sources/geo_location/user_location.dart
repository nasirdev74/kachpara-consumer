import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class UserLocationData {
  UserLocationData(this._firestore);
  final FirebaseFirestore _firestore;

  Future<Result<Position>> getCurrentLocation(LocationAccuracy locationAccuracy) async {
    try {
      LocationPermission permission;
      // Test if location services are enabled.
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        throw Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          throw Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        throw Future.error('Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: locationAccuracy);
      return Result.success(position);
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: login: error: $e');
      }
      return Result.error(e.toString());
    }
  }

  Future<bool> checkIfDistanceIsNear(Position userPosition, double latitude, double longitude) async {
    final doc = await _firestore.collection("configs").doc("userDistanceFromStore").get();
    int minimalDistance = doc.data()?["minimalDistance"];
    final distance = Geolocator.distanceBetween(userPosition.latitude, userPosition.longitude, latitude, longitude);
    if (distance > minimalDistance) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkIfInDeliveryZone(Position userPosition, double latitude, double longitude) async {
    final doc = await _firestore.collection("configs").doc("userDistanceFromStore").get();
    int minimalDistance = doc.data()?["deliveryZone"];
    final distance = Geolocator.distanceBetween(userPosition.latitude, userPosition.longitude, latitude, longitude);
    if (distance > minimalDistance) {
      return false;
    } else {
      return true;
    }
  }
}

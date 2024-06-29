part of 'google_map_cubit.dart';

abstract class GoogleMapState extends Equatable {
  const GoogleMapState();

  @override
  List<Object> get props => [];
}

class MapState extends GoogleMapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final double lat;
  final double lng;

  MapLoaded({required this.lat, required this.lng});

  @override
  List<Object> get props => [lat, lng];
}

class AddressState extends GoogleMapState {}

class AddressInitial extends MapState {}

class AddressLoading extends MapState {}

class AddressLoaded extends MapState {
  final List<Prediction> predictionList;

  AddressLoaded({required this.predictionList});
}

class AddressSectionState extends GoogleMapState {}

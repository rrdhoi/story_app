import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_location_state.freezed.dart';

@freezed
class MapLocationState with _$MapLocationState {
  const factory MapLocationState({
    @Default(false) bool isLoading,
    @Default(LatLng(-6.8957473, 107.6337669)) LatLng currentLocation,
    @Default({}) Set<Marker> markers,
    Placemark? placeMark,
    String? errorMessage,
  }) = _MapLocationStateLocation;
}

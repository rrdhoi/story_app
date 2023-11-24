import 'dart:async';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/constants/app_assets.dart';
import 'package:story_app/app/services/location_manager.dart';
import 'package:story_app/providers/story/map/state/map_location_state.dart';
import 'package:geocoding/geocoding.dart' as geo;

import '../../../app/styles/app_theme.dart';

final mapLocationProvider =
    StateNotifierProvider.autoDispose<MapLocationNotifier, MapLocationState>(
        (ref) {
  return MapLocationNotifier(ref, Completer());
});

class MapLocationNotifier extends StateNotifier<MapLocationState> {
  final Ref ref;
  final Completer<GoogleMapController> _mapController;

  MapLocationNotifier(this.ref, this._mapController)
      : super(const MapLocationState());

  Future<void> onMapCreated(GoogleMapController controller) async {
    final themeMode = ref.watch(appThemeProvider);

    if (themeMode == Brightness.dark) {
      final darkModeMapStyle =
          await rootBundle.loadString(AppAssets.googleMapStyleDarkMode);

      await controller.setMapStyle(darkModeMapStyle);
    }
    _mapController.complete(controller);
  }

  void onSetPosition(LatLng latLng) async {
    state = state.copyWith(currentLocation: latLng);
    await _addAddress(latLng);
    _addMarker(latLng);
    _animateToLocation(latLng);
  }

  Future<void> getCurrentLocation() async {
    state = state.copyWith(isLoading: true);
    try {
      final location = await LocationManager.getCurrentPosition();
      final LatLng currentLatLng =
          LatLng(location.latitude, location.longitude);

      await _addAddress(currentLatLng);
      _updateLocation(currentLatLng);
      _addMarker(currentLatLng);
      _animateToLocation(currentLatLng);
    } on Exception catch (e) {
      _handleError(e.toString());
    }
  }

  Future<void> getNewLocation() async {
    _addMarker(state.currentLocation);
    _animateToLocation(state.currentLocation);
  }

  void _addMarker(LatLng latLng) {
    final Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
      ),
    );
    state = state.copyWith(markers: markers);
  }

  void _animateToLocation(LatLng latLng) async {
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 18);
    final GoogleMapController controller = await _mapController.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _updateLocation(LatLng currentLocation) {
    state = state.copyWith(isLoading: false, currentLocation: currentLocation);
  }

  void _handleError(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  Future<void> _addAddress(LatLng latLng) async {
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    state = state.copyWith(placeMark: place);
  }

  @override
  void dispose() {
    _mapController.future.then((value) => value.dispose());
    super.dispose();
  }
}

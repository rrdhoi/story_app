import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef NamedRoute = ({String path, String name});
typedef UserRegisterResponse = ({bool error, String message});
typedef CreateStoryResponse = ({bool error, String message});
typedef SignUpPayload = Map<String, dynamic>;
typedef SignInPayload = Map<String, dynamic>;
typedef DetailMapParam = ({bool isViewOnly, LatLng? latLng});

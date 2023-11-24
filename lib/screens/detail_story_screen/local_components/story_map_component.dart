import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/styles/app_theme.dart';

final mapControllerProvider =
    StateProvider.autoDispose<GoogleMapController?>((ref) {
  return null;
});

class StoryMapComponent extends HookConsumerWidget {
  const StoryMapComponent({super.key, this.coordinate, required this.onMapTap});

  final LatLng? coordinate;
  final VoidCallback onMapTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.location.tr(),
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onMapTap,
          child: (coordinate != null)
              ? AbsorbPointer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 140,
                      child: GoogleMap(
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: false,
                        initialCameraPosition: CameraPosition(
                          zoom: 18,
                          target: coordinate!,
                        ),
                        markers: {
                          Marker(
                            position: LatLng(
                              coordinate!.latitude,
                              coordinate!.longitude,
                            ),
                            markerId: MarkerId(coordinate.toString()),
                          ),
                        },
                        onMapCreated: (controller) async {
                          ref.read(mapControllerProvider.notifier).state =
                              controller;
                          final themeMode = ref.watch(appThemeProvider);
                          if (themeMode == Brightness.dark) {
                            final darkModeMapStyle = await rootBundle
                                .loadString(AppAssets.googleMapStyleDarkMode);

                            await controller.setMapStyle(darkModeMapStyle);
                          }

                          CameraPosition cameraPosition =
                              CameraPosition(target: coordinate!, zoom: 18);
                          await controller.animateCamera(
                            CameraUpdate.newCameraPosition(cameraPosition),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.appTheme.colorScheme.onInverseSurface,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        LocaleKeys.selectLocation.tr(),
                        style: context.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/providers/story/map/map_location_provider.dart';
import 'package:story_app/screens/create_story_screen/create_story_screen.dart';
import 'package:story_app/screens/create_story_screen/story_map/local_components/placemark_widget.dart';

class StoryMapScreen extends HookConsumerWidget {
  const StoryMapScreen({super.key, required this.isViewOnly, this.position});

  final bool isViewOnly;
  final LatLng? position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapLocationState = ref.watch(mapLocationProvider);
    final mapLocationNotifier = ref.watch(mapLocationProvider.notifier);
    final storyLocationState = ref.watch(storyLocationProvider);

    useEffect(
      () {
        if (storyLocationState == null && position == null) {
          Future.microtask(
            () async =>
                ref.read(mapLocationProvider.notifier).getCurrentLocation(),
          );
        }
        return null;
      },
      [],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new, size: 24),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.onInverseSurface,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              zoom: 18,
              target: (position != null)
                  ? position!
                  : storyLocationState ?? mapLocationState.currentLocation,
            ),
            onMapCreated: (controller) async {
              await mapLocationNotifier.onMapCreated(controller);
              if (storyLocationState != null || position != null) {
                mapLocationNotifier.onSetPosition(
                  (position != null) ? position! : storyLocationState!,
                );
              }
            },
            markers: position != null
                ? {
                    Marker(
                      markerId: MarkerId(position.toString()),
                      position: position!,
                    ),
                  }
                : mapLocationState.markers,
            onTap: isViewOnly ? null : mapLocationNotifier.onSetPosition,
          ),
          if (mapLocationState.isLoading)
            Align(
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  color: context.colorScheme.onInverseSurface,
                ),
                child: CircularProgressIndicator(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          Positioned(
            bottom: 26,
            right: 16,
            left: 16,
            child: Column(
              children: [
                if (isViewOnly == false)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      child: const Icon(Icons.my_location),
                      onPressed: () async {
                        await mapLocationNotifier.getCurrentLocation();
                        await mapLocationNotifier.getNewLocation();
                      },
                    ),
                  ),
                const SizedBox(height: 8),
                PlaceMarkWidget(
                  isViewOnly: isViewOnly,
                  placeMark: mapLocationState.placeMark,
                  onSelected: () {
                    ref.read(storyLocationProvider.notifier).state =
                        mapLocationState.currentLocation;
                    context.pop(mapLocationState.currentLocation);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

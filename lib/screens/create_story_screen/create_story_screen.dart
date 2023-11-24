import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/common/extension/string_extension.dart';
import 'package:story_app/app/common/utils/payload_manager.dart';
import 'package:story_app/app/config/flavor/app_flavor_config.dart';
import 'package:story_app/app/config/flavor/app_flavor_type.dart';
import 'package:story_app/app/routers/named_routes.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/widgets/custom_button.dart';
import 'package:story_app/widgets/custom_dialog.dart';

import '../../providers/story/create_story/create_story_provider.dart';
import '../../providers/story/create_story/create_story_state.dart';
import '../../widgets/custom_form_field.dart';
import '../detail_story_screen/local_components/story_map_component.dart';

final imageNewStoryProvider = StateProvider.autoDispose<XFile?>((ref) {
  return null;
});

final storyLocationProvider = StateProvider.autoDispose<LatLng?>((ref) {
  return null;
});

class CreateStoryScreen extends HookConsumerWidget {
  const CreateStoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createStoryState = ref.watch(createStoryProvider);
    final imageNewStoryState = ref.watch(imageNewStoryProvider);
    final storyLocationState = ref.watch(storyLocationProvider);
    final mapControllerNotifier = ref.watch(mapControllerProvider.notifier);
    final descriptionController = useTextEditingController();
    final formKey = useRef(GlobalKey<FormState>()).value;

    useEffect(
      () => () {
        mapControllerNotifier.state?.dispose();
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.goNamed(NamedRoutes.home.name);
          },
        ),
        title: Text(LocaleKeys.createStory.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 320,
                child: imageNewStoryState != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          File(imageNewStoryState.path),
                          fit: BoxFit.cover,
                        ),
                      )
                    : GestureDetector(
                        onTap: () async => _onCameraButtonClick(context, ref),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 2,
                              color:
                                  context.appTheme.colorScheme.onInverseSurface,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: context.colorScheme.onSurface,
                                size: 48,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                LocaleKeys.takeAPicture.tr(),
                                style: context.textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              Form(
                key: formKey,
                child: CustomFormField(
                  title: LocaleKeys.description.tr(),
                  hint: LocaleKeys.enterDescription.tr(),
                  controller: descriptionController,
                  isExpanded: true,
                  textInputType: TextInputType.emailAddress,
                  validator: (String? input) {
                    return input.isNotNullOrNotEmpty
                        ? null
                        : LocaleKeys.enterDescription.tr();
                  },
                ),
              ),
              const SizedBox(height: 16),
              (AppFlavorConfig.instance.flavor == AppFlavorType.free)
                  ? _buildPremiumVersion(context)
                  : StoryMapComponent(
                      coordinate: storyLocationState,
                      onMapTap: () async {
                        final data = await context.pushNamed(
                          NamedRoutes.storyMap.name,
                          extra: PayloadManager.detailMapParam(
                            (
                              isViewOnly: false,
                              latLng: null,
                            ),
                          ),
                        );

                        final mapControllerState =
                            ref.watch(mapControllerProvider);
                        if (mapControllerState != null && data != null) {
                          final newPosition = data as LatLng;
                          CameraPosition cameraPosition =
                              CameraPosition(target: newPosition, zoom: 18);
                          await mapControllerState.animateCamera(
                            CameraUpdate.newCameraPosition(cameraPosition),
                          );
                        }
                      },
                    ),
              const SizedBox(height: 24),
              CustomButton(
                width: double.infinity,
                onPressed: () async {
                  if (formKey.currentState!.validate() &&
                      imageNewStoryState != null) {
                    await ref.read(createStoryProvider.notifier).createStory(
                          descriptionController.text,
                          imageNewStoryState,
                          storyLocationState,
                        );

                    final createStoryState = ref.watch(createStoryProvider);
                    if (createStoryState is CreateStoryStateSuccess) {
                      context.goNamed(NamedRoutes.home.name);
                    } else if (createStoryState is CreateStoryStateError) {
                      await context.showCustomDialog(
                        title: "Error",
                        message: LocaleKeys.errorAccessNetwork.tr(),
                        primaryText: LocaleKeys.close.tr(),
                        onPrimaryPressedMulti: () {
                          context.goNamed(NamedRoutes.signIn.name);
                        },
                      );
                    }
                  }
                },
                isLoading: createStoryState is CreateStoryStateLoading,
                title: LocaleKeys.createStory.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumVersion(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.onInverseSurface),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(
        LocaleKeys.freeVersionInformation.tr(),
        style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
      ),
    );
  }

  Future<void> _onCameraButtonClick(BuildContext context, WidgetRef ref) async {
    final cameras = await availableCameras();
    final data =
        await context.pushNamed(NamedRoutes.camera.name, extra: cameras);

    if (data != null) {
      final XFile resultImageFile = data as XFile;
      ref.read(imageNewStoryProvider.notifier).state = resultImageFile;
    }
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/common/utils/payload_manager.dart';
import 'package:story_app/app/routers/named_routes.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/providers/story/get_detail_story/get_detail_story_provider.dart';

import '../../providers/story/get_detail_story/get_detail_story_state.dart';
import 'local_components/story_map_component.dart';

class DetailStoryScreen extends HookConsumerWidget {
  const DetailStoryScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailStoryState = ref.watch(getDetailStoryProvider);
    final mapControllerNotifier = ref.watch(mapControllerProvider.notifier);
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 320));

    _fetchDetailStoryData(ref, id, detailStoryState);

    useEffect(
      () => () {
        mapControllerNotifier.state?.dispose();
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ${LocaleKeys.story.tr()}"),
      ),
      body: detailStoryState.whenOrNull(
        loaded: (storyModel) {
          animationController.forward();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: animationController,
                  builder: (_, child) {
                    return Padding(
                      padding: EdgeInsets.all(16 * animationController.value),
                      child: child,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 200,
                      child: Image.network(
                        storyModel.photoUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                AnimatedContent(
                  controller: animationController,
                  child: Text(
                    storyModel.name,
                    style: context.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedContent(
                  controller: animationController,
                  child: Text(
                    storyModel.createdAt,
                    style: context.textTheme.labelLarge,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedContent(
                  controller: animationController,
                  child: Text(
                    LocaleKeys.description.tr(),
                    style: context.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 2),
                AnimatedContent(
                  controller: animationController,
                  child: Text(
                    storyModel.description,
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 16),
                if (storyModel.lat != null)
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (_, child) => Opacity(
                      opacity: 1 * animationController.value,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 30,
                        ),
                        child: child,
                      ),
                    ),
                    child: StoryMapComponent(
                      coordinate: LatLng(storyModel.lat!, storyModel.lon!),
                      onMapTap: () {
                        context.goNamed(
                          NamedRoutes.storyDetailMap.name,
                          pathParameters: {"id": id},
                          extra: PayloadManager.detailMapParam(
                            (
                              isViewOnly: true,
                              latLng: LatLng(storyModel.lat!, storyModel.lon!)
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
        error: (_, message) => Center(
          child: Text(
            LocaleKeys.errorAccessNetwork.tr(),
            style: context.textTheme.bodyLarge,
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(color: context.colorScheme.primary),
        ),
      ),
    );
  }

  void _fetchDetailStoryData(
    WidgetRef ref,
    String id,
    GetDetailStoryState detailStoryState,
  ) {
    useEffect(() {
      if (detailStoryState is GetDetailStoryStateInital) {
        Future.microtask(
          () async =>
              ref.read(getDetailStoryProvider.notifier).getDetailStory(id),
        );
      }
      return null;
    });
  }
}

class AnimatedContent extends StatelessWidget {
  const AnimatedContent({
    super.key,
    required this.controller,
    required this.child,
  });

  final AnimationController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) => Padding(
        padding: EdgeInsets.only(
          left: 16 * controller.value,
        ),
        child: child,
      ),
      child: child,
    );
  }
}

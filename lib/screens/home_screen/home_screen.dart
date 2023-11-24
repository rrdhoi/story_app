import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/routers/named_routes.dart';
import 'package:story_app/app/shared/l10n/locale_keys.g.dart';
import 'package:story_app/providers/story/get_stories/get_stories_provider.dart';
import 'package:story_app/widgets/card_story_widget.dart';

import 'local_components/popup_menu_icon.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyState = ref.watch(getStoriesProvider);
    final storyNotifier = ref.watch(getStoriesProvider.notifier);
    final scrollController = useScrollController();

    useEffect(
      () {
        Future.microtask(() async => storyNotifier.getStories());

        scrollController.addListener(() {
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent) {
            if (storyNotifier.pageItems != null) {
              Future.microtask(() async => storyNotifier.getStories());
            }
          }
        });
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.appTitle).tr(),
        actions: const [
          PopupMenuLocale(),
          PopupMenuHome(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.goNamed(NamedRoutes.createStory.name);
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: storyState.maybeWhen(
        loading: () => Center(
          child: CircularProgressIndicator(
            color: context.colorScheme.primary,
          ),
        ),
        loaded: (stories) => ListView.builder(
          controller: scrollController,
          itemCount: stories.length + (storyNotifier.pageItems != null ? 1 : 0),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
            top: 8,
          ),
          itemBuilder: (_, index) {
            if (index == stories.length && storyNotifier.pageItems != null) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return CardStoryWidget(
              storyModel: stories[index],
            );
          },
        ),
        error: (httpStatus, message) => Center(
          child: Text(
            LocaleKeys.errorAccessNetwork.tr(),
            style: context.textTheme.bodyLarge,
          ),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}

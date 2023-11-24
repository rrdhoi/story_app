import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/extension/context_extension.dart';
import 'package:story_app/app/routers/named_routes.dart';

import '../data/models/story_model/story_model.dart';

class CardStoryWidget extends HookConsumerWidget {
  const CardStoryWidget({super.key, required this.storyModel});

  final StoryModel storyModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onHover = useState(false);

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          NamedRoutes.detailStory.name,
          pathParameters: {'id': storyModel.id},
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FocusableActionDetector(
          onShowHoverHighlight: (isHover) {
            onHover.value = isHover;
          },
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: onHover.value
                ? context.colorScheme.surfaceVariant
                : context.colorScheme.onInverseSurface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Text(
                            storyModel.id.characters.first.toUpperCase(),
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            storyModel.name,
                            style: context.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            storyModel.createdAt,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 188,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(storyModel.photoUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Location (${storyModel.lat}, ${storyModel.lon})",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Text(
                    storyModel.description,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/data/models/story_model/story_model.dart';
import 'package:story_app/data/repositories/story_repository.dart';
import 'package:story_app/data/repositories/story_repository_impl.dart';

import 'get_stories_state.dart';

final getStoriesProvider =
    StateNotifierProvider.autoDispose<GetStoriesNotifier, GetStoriesState>(
        (ref) {
  final storyRepository = ref.read(storyRepositoryProvider);
  return GetStoriesNotifier(storyRepository: storyRepository);
});

class GetStoriesNotifier extends StateNotifier<GetStoriesState> {
  final StoryRepository storyRepository;

  GetStoriesNotifier({required this.storyRepository})
      : super(const GetStoriesState.initial());

  int? pageItems = 1;
  int sizeItems = 10;
  List<StoryModel> listStory = [];

  Future<void> getStories() async {
    if (pageItems == 1) {
      state = const GetStoriesState.loading();
    }
    final result = await storyRepository.getAllStories(pageItems!, sizeItems);

    state = result.fold(
        (error) => GetStoriesState.error(
              httpStatus: error.httpStatus,
              message: error.message,
            ), (response) {
      if (response.data != null) {
        listStory.addAll(response.data!);

        if (response.data!.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }

        return GetStoriesState.loaded(stories: listStory);
      } else {
        return const GetStoriesState.empty();
      }
    });
  }
}

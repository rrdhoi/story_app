import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/data/repositories/story_repository.dart';
import 'package:story_app/data/repositories/story_repository_impl.dart';

import 'get_detail_story_state.dart';

final getDetailStoryProvider = StateNotifierProvider.autoDispose<
    GetDetailStoryNotifier, GetDetailStoryState>((ref) {
  final storyRepository = ref.read(storyRepositoryProvider);
  return GetDetailStoryNotifier(storyRepository: storyRepository);
});

class GetDetailStoryNotifier extends StateNotifier<GetDetailStoryState> {
  final StoryRepository storyRepository;

  GetDetailStoryNotifier({required this.storyRepository})
      : super(const GetDetailStoryState.initial());

  Future<void> getDetailStory(String id) async {
    state = const GetDetailStoryState.loading();

    final result = await storyRepository.getDetailStory(id);

    state = result.fold(
      (error) => GetDetailStoryState.error(
        httpStatus: error.httpStatus,
        message: error.message,
      ),
      (response) => GetDetailStoryState.loaded(storyModel: response.data),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_app/app/common/utils/image_compress.dart';
import 'package:story_app/data/repositories/story_repository.dart';
import 'package:story_app/data/repositories/story_repository_impl.dart';

import 'create_story_state.dart';

final createStoryProvider =
    StateNotifierProvider.autoDispose<CreateStoryNotifier, CreateStoryState>(
        (ref) {
  final storyRepository = ref.read(storyRepositoryProvider);
  return CreateStoryNotifier(storyRepository: storyRepository);
});

class CreateStoryNotifier extends StateNotifier<CreateStoryState> {
  final StoryRepository storyRepository;

  CreateStoryNotifier({required this.storyRepository})
      : super(const CreateStoryStateInital());

  Future<void> createStory(
    String description,
    XFile imageFile,
    LatLng? latLng,
  ) async {
    state = const CreateStoryStateLoading();

    final listImageByte = await imageFile.readAsBytes();
    final imageHasCompressed = await compressImage(listImageByte);

    final result = await storyRepository.createStory(
      description,
      imageHasCompressed,
      imageFile.name,
      latLng,
    );

    state = result.fold(
      (error) => CreateStoryStateError(
        httpStatus: error.httpStatus,
        message: error.message,
      ),
      (response) => CreateStoryStateSuccess(createStoryResponse: response),
    );
  }
}

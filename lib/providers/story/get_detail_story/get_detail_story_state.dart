import 'package:story_app/data/models/story_model/story_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_detail_story_state.freezed.dart';

@freezed
abstract class GetDetailStoryState with _$GetDetailStoryState {
  const factory GetDetailStoryState.initial() = GetDetailStoryStateInital;
  const factory GetDetailStoryState.loading() = GetDetailStoryStateLoading;
  const factory GetDetailStoryState.loaded({required StoryModel storyModel}) =
      GetDetailStoryStateLoaded;
  const factory GetDetailStoryState.error({int? httpStatus, String? message}) =
      GetDetailStoryStateError;
  const factory GetDetailStoryState.empty() = GetDetailStoryStateEmpty;
}

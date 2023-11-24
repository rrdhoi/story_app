import '../../../../data/models/story_model/story_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stories_state.freezed.dart';

@freezed
abstract class GetStoriesState with _$GetStoriesState {
  const factory GetStoriesState.initial() = _GetStoriesStateInital;
  const factory GetStoriesState.loading() = _GetStoriesStateLoading;
  const factory GetStoriesState.loaded({required List<StoryModel> stories}) =
      _GetStoriesStateLoaded;
  const factory GetStoriesState.error({int? httpStatus, String? message}) =
      _GetStoriesStateError;
  const factory GetStoriesState.empty() = _GetStoriesStateEmpty;
}

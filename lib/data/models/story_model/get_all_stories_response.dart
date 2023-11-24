import 'package:story_app/data/models/story_model/story_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_stories_response.freezed.dart';
part 'get_all_stories_response.g.dart';

@freezed
class GetAllStoriesResponse with _$GetAllStoriesResponse {
  const factory GetAllStoriesResponse({
    required bool error,
    required String message,
    @JsonKey(name: "listStory") required List<StoryModel>? data,
  }) = _GetAllStoriesResponse;

  factory GetAllStoriesResponse.fromJson(Map<String, Object?> json) =>
      _$GetAllStoriesResponseFromJson(json);
}

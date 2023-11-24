import 'package:story_app/data/models/story_model/story_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_detail_story_response.freezed.dart';
part 'get_detail_story_response.g.dart';

@freezed
class GetDetailStoryResponse with _$GetDetailStoryResponse {
  const factory GetDetailStoryResponse({
    required bool error,
    required String message,
    @JsonKey(name: "story") required StoryModel data,
  }) = _GetDetailStoryResponse;

  factory GetDetailStoryResponse.fromJson(Map<String, Object?> json) =>
      _$GetDetailStoryResponseFromJson(json);
}

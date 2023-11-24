import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class StoryModel with _$StoryModel {
  const factory StoryModel({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required String createdAt,
    required double? lat,
    required double? lon,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, Object?> json) =>
      _$StoryModelFromJson(json);
}

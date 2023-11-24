// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetDetailStoryResponseImpl _$$GetDetailStoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetDetailStoryResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: StoryModel.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetDetailStoryResponseImplToJson(
        _$GetDetailStoryResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_stories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllStoriesResponseImpl _$$GetAllStoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllStoriesResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['listStory'] as List<dynamic>?)
          ?.map((e) => StoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAllStoriesResponseImplToJson(
        _$GetAllStoriesResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.data,
    };

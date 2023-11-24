// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_detail_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetDetailStoryResponse _$GetDetailStoryResponseFromJson(
    Map<String, dynamic> json) {
  return _GetDetailStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$GetDetailStoryResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "story")
  StoryModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetDetailStoryResponseCopyWith<GetDetailStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetDetailStoryResponseCopyWith<$Res> {
  factory $GetDetailStoryResponseCopyWith(GetDetailStoryResponse value,
          $Res Function(GetDetailStoryResponse) then) =
      _$GetDetailStoryResponseCopyWithImpl<$Res, GetDetailStoryResponse>;
  @useResult
  $Res call(
      {bool error, String message, @JsonKey(name: "story") StoryModel data});

  $StoryModelCopyWith<$Res> get data;
}

/// @nodoc
class _$GetDetailStoryResponseCopyWithImpl<$Res,
        $Val extends GetDetailStoryResponse>
    implements $GetDetailStoryResponseCopyWith<$Res> {
  _$GetDetailStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StoryModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryModelCopyWith<$Res> get data {
    return $StoryModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetDetailStoryResponseImplCopyWith<$Res>
    implements $GetDetailStoryResponseCopyWith<$Res> {
  factory _$$GetDetailStoryResponseImplCopyWith(
          _$GetDetailStoryResponseImpl value,
          $Res Function(_$GetDetailStoryResponseImpl) then) =
      __$$GetDetailStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool error, String message, @JsonKey(name: "story") StoryModel data});

  @override
  $StoryModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetDetailStoryResponseImplCopyWithImpl<$Res>
    extends _$GetDetailStoryResponseCopyWithImpl<$Res,
        _$GetDetailStoryResponseImpl>
    implements _$$GetDetailStoryResponseImplCopyWith<$Res> {
  __$$GetDetailStoryResponseImplCopyWithImpl(
      _$GetDetailStoryResponseImpl _value,
      $Res Function(_$GetDetailStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$GetDetailStoryResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StoryModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetDetailStoryResponseImpl implements _GetDetailStoryResponse {
  const _$GetDetailStoryResponseImpl(
      {required this.error,
      required this.message,
      @JsonKey(name: "story") required this.data});

  factory _$GetDetailStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetDetailStoryResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @override
  @JsonKey(name: "story")
  final StoryModel data;

  @override
  String toString() {
    return 'GetDetailStoryResponse(error: $error, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailStoryResponseImplCopyWith<_$GetDetailStoryResponseImpl>
      get copyWith => __$$GetDetailStoryResponseImplCopyWithImpl<
          _$GetDetailStoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetDetailStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _GetDetailStoryResponse implements GetDetailStoryResponse {
  const factory _GetDetailStoryResponse(
          {required final bool error,
          required final String message,
          @JsonKey(name: "story") required final StoryModel data}) =
      _$GetDetailStoryResponseImpl;

  factory _GetDetailStoryResponse.fromJson(Map<String, dynamic> json) =
      _$GetDetailStoryResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(name: "story")
  StoryModel get data;
  @override
  @JsonKey(ignore: true)
  _$$GetDetailStoryResponseImplCopyWith<_$GetDetailStoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

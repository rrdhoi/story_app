// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_stories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetAllStoriesResponse _$GetAllStoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetAllStoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetAllStoriesResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "listStory")
  List<StoryModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAllStoriesResponseCopyWith<GetAllStoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllStoriesResponseCopyWith<$Res> {
  factory $GetAllStoriesResponseCopyWith(GetAllStoriesResponse value,
          $Res Function(GetAllStoriesResponse) then) =
      _$GetAllStoriesResponseCopyWithImpl<$Res, GetAllStoriesResponse>;
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: "listStory") List<StoryModel>? data});
}

/// @nodoc
class _$GetAllStoriesResponseCopyWithImpl<$Res,
        $Val extends GetAllStoriesResponse>
    implements $GetAllStoriesResponseCopyWith<$Res> {
  _$GetAllStoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllStoriesResponseImplCopyWith<$Res>
    implements $GetAllStoriesResponseCopyWith<$Res> {
  factory _$$GetAllStoriesResponseImplCopyWith(
          _$GetAllStoriesResponseImpl value,
          $Res Function(_$GetAllStoriesResponseImpl) then) =
      __$$GetAllStoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: "listStory") List<StoryModel>? data});
}

/// @nodoc
class __$$GetAllStoriesResponseImplCopyWithImpl<$Res>
    extends _$GetAllStoriesResponseCopyWithImpl<$Res,
        _$GetAllStoriesResponseImpl>
    implements _$$GetAllStoriesResponseImplCopyWith<$Res> {
  __$$GetAllStoriesResponseImplCopyWithImpl(_$GetAllStoriesResponseImpl _value,
      $Res Function(_$GetAllStoriesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$GetAllStoriesResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllStoriesResponseImpl implements _GetAllStoriesResponse {
  const _$GetAllStoriesResponseImpl(
      {required this.error,
      required this.message,
      @JsonKey(name: "listStory") required final List<StoryModel>? data})
      : _data = data;

  factory _$GetAllStoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllStoriesResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<StoryModel>? _data;
  @override
  @JsonKey(name: "listStory")
  List<StoryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetAllStoriesResponse(error: $error, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllStoriesResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, error, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllStoriesResponseImplCopyWith<_$GetAllStoriesResponseImpl>
      get copyWith => __$$GetAllStoriesResponseImplCopyWithImpl<
          _$GetAllStoriesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllStoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _GetAllStoriesResponse implements GetAllStoriesResponse {
  const factory _GetAllStoriesResponse(
          {required final bool error,
          required final String message,
          @JsonKey(name: "listStory") required final List<StoryModel>? data}) =
      _$GetAllStoriesResponseImpl;

  factory _GetAllStoriesResponse.fromJson(Map<String, dynamic> json) =
      _$GetAllStoriesResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(name: "listStory")
  List<StoryModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetAllStoriesResponseImplCopyWith<_$GetAllStoriesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

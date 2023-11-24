// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapLocationState {
  bool get isLoading => throw _privateConstructorUsedError;
  LatLng get currentLocation => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  Placemark? get placeMark => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapLocationStateCopyWith<MapLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapLocationStateCopyWith<$Res> {
  factory $MapLocationStateCopyWith(
          MapLocationState value, $Res Function(MapLocationState) then) =
      _$MapLocationStateCopyWithImpl<$Res, MapLocationState>;
  @useResult
  $Res call(
      {bool isLoading,
      LatLng currentLocation,
      Set<Marker> markers,
      Placemark? placeMark,
      String? errorMessage});
}

/// @nodoc
class _$MapLocationStateCopyWithImpl<$Res, $Val extends MapLocationState>
    implements $MapLocationStateCopyWith<$Res> {
  _$MapLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentLocation = null,
    Object? markers = null,
    Object? placeMark = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      placeMark: freezed == placeMark
          ? _value.placeMark
          : placeMark // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapLocationStateLocationImplCopyWith<$Res>
    implements $MapLocationStateCopyWith<$Res> {
  factory _$$MapLocationStateLocationImplCopyWith(
          _$MapLocationStateLocationImpl value,
          $Res Function(_$MapLocationStateLocationImpl) then) =
      __$$MapLocationStateLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      LatLng currentLocation,
      Set<Marker> markers,
      Placemark? placeMark,
      String? errorMessage});
}

/// @nodoc
class __$$MapLocationStateLocationImplCopyWithImpl<$Res>
    extends _$MapLocationStateCopyWithImpl<$Res, _$MapLocationStateLocationImpl>
    implements _$$MapLocationStateLocationImplCopyWith<$Res> {
  __$$MapLocationStateLocationImplCopyWithImpl(
      _$MapLocationStateLocationImpl _value,
      $Res Function(_$MapLocationStateLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentLocation = null,
    Object? markers = null,
    Object? placeMark = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MapLocationStateLocationImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      placeMark: freezed == placeMark
          ? _value.placeMark
          : placeMark // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MapLocationStateLocationImpl implements _MapLocationStateLocation {
  const _$MapLocationStateLocationImpl(
      {this.isLoading = false,
      this.currentLocation = const LatLng(-6.8957473, 107.6337669),
      final Set<Marker> markers = const {},
      this.placeMark,
      this.errorMessage})
      : _markers = markers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final LatLng currentLocation;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  final Placemark? placeMark;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MapLocationState(isLoading: $isLoading, currentLocation: $currentLocation, markers: $markers, placeMark: $placeMark, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapLocationStateLocationImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.placeMark, placeMark) ||
                other.placeMark == placeMark) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentLocation,
      const DeepCollectionEquality().hash(_markers), placeMark, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapLocationStateLocationImplCopyWith<_$MapLocationStateLocationImpl>
      get copyWith => __$$MapLocationStateLocationImplCopyWithImpl<
          _$MapLocationStateLocationImpl>(this, _$identity);
}

abstract class _MapLocationStateLocation implements MapLocationState {
  const factory _MapLocationStateLocation(
      {final bool isLoading,
      final LatLng currentLocation,
      final Set<Marker> markers,
      final Placemark? placeMark,
      final String? errorMessage}) = _$MapLocationStateLocationImpl;

  @override
  bool get isLoading;
  @override
  LatLng get currentLocation;
  @override
  Set<Marker> get markers;
  @override
  Placemark? get placeMark;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MapLocationStateLocationImplCopyWith<_$MapLocationStateLocationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

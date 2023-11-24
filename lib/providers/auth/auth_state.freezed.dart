// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateInitialImplCopyWith<$Res> {
  factory _$$AuthStateInitialImplCopyWith(_$AuthStateInitialImpl value,
          $Res Function(_$AuthStateInitialImpl) then) =
      __$$AuthStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitialImpl>
    implements _$$AuthStateInitialImplCopyWith<$Res> {
  __$$AuthStateInitialImplCopyWithImpl(_$AuthStateInitialImpl _value,
      $Res Function(_$AuthStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateInitialImpl implements AuthStateInitial {
  const _$AuthStateInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial implements AuthState {
  const factory AuthStateInitial() = _$AuthStateInitialImpl;
}

/// @nodoc
abstract class _$$SignInStateLoadingImplCopyWith<$Res> {
  factory _$$SignInStateLoadingImplCopyWith(_$SignInStateLoadingImpl value,
          $Res Function(_$SignInStateLoadingImpl) then) =
      __$$SignInStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStateLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignInStateLoadingImpl>
    implements _$$SignInStateLoadingImplCopyWith<$Res> {
  __$$SignInStateLoadingImplCopyWithImpl(_$SignInStateLoadingImpl _value,
      $Res Function(_$SignInStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInStateLoadingImpl implements SignInStateLoading {
  const _$SignInStateLoadingImpl();

  @override
  String toString() {
    return 'AuthState.signInLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return signInLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return signInLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (signInLoading != null) {
      return signInLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return signInLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return signInLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (signInLoading != null) {
      return signInLoading(this);
    }
    return orElse();
  }
}

abstract class SignInStateLoading implements AuthState {
  const factory SignInStateLoading() = _$SignInStateLoadingImpl;
}

/// @nodoc
abstract class _$$SignInStateSuccessImplCopyWith<$Res> {
  factory _$$SignInStateSuccessImplCopyWith(_$SignInStateSuccessImpl value,
          $Res Function(_$SignInStateSuccessImpl) then) =
      __$$SignInStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignInResponse response});

  $SignInResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$SignInStateSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignInStateSuccessImpl>
    implements _$$SignInStateSuccessImplCopyWith<$Res> {
  __$$SignInStateSuccessImplCopyWithImpl(_$SignInStateSuccessImpl _value,
      $Res Function(_$SignInStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SignInStateSuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as SignInResponse,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SignInResponseCopyWith<$Res> get response {
    return $SignInResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$SignInStateSuccessImpl implements SignInStateSuccess {
  const _$SignInStateSuccessImpl({required this.response});

  @override
  final SignInResponse response;

  @override
  String toString() {
    return 'AuthState.signInSuccess(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateSuccessImplCopyWith<_$SignInStateSuccessImpl> get copyWith =>
      __$$SignInStateSuccessImplCopyWithImpl<_$SignInStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return signInSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return signInSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (signInSuccess != null) {
      return signInSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return signInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return signInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (signInSuccess != null) {
      return signInSuccess(this);
    }
    return orElse();
  }
}

abstract class SignInStateSuccess implements AuthState {
  const factory SignInStateSuccess({required final SignInResponse response}) =
      _$SignInStateSuccessImpl;

  SignInResponse get response;
  @JsonKey(ignore: true)
  _$$SignInStateSuccessImplCopyWith<_$SignInStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInStateErrorImplCopyWith<$Res> {
  factory _$$SignInStateErrorImplCopyWith(_$SignInStateErrorImpl value,
          $Res Function(_$SignInStateErrorImpl) then) =
      __$$SignInStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? httpStatus, String? message});
}

/// @nodoc
class __$$SignInStateErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignInStateErrorImpl>
    implements _$$SignInStateErrorImplCopyWith<$Res> {
  __$$SignInStateErrorImplCopyWithImpl(_$SignInStateErrorImpl _value,
      $Res Function(_$SignInStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SignInStateErrorImpl(
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignInStateErrorImpl implements SignInStateError {
  const _$SignInStateErrorImpl({this.httpStatus, this.message});

  @override
  final int? httpStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.signInError(httpStatus: $httpStatus, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateErrorImpl &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, httpStatus, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateErrorImplCopyWith<_$SignInStateErrorImpl> get copyWith =>
      __$$SignInStateErrorImplCopyWithImpl<_$SignInStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return signInError(httpStatus, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return signInError?.call(httpStatus, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (signInError != null) {
      return signInError(httpStatus, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return signInError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return signInError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (signInError != null) {
      return signInError(this);
    }
    return orElse();
  }
}

abstract class SignInStateError implements AuthState {
  const factory SignInStateError(
      {final int? httpStatus, final String? message}) = _$SignInStateErrorImpl;

  int? get httpStatus;
  String? get message;
  @JsonKey(ignore: true)
  _$$SignInStateErrorImplCopyWith<_$SignInStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpStateLoadingImplCopyWith<$Res> {
  factory _$$SignUpStateLoadingImplCopyWith(_$SignUpStateLoadingImpl value,
          $Res Function(_$SignUpStateLoadingImpl) then) =
      __$$SignUpStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpStateLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignUpStateLoadingImpl>
    implements _$$SignUpStateLoadingImplCopyWith<$Res> {
  __$$SignUpStateLoadingImplCopyWithImpl(_$SignUpStateLoadingImpl _value,
      $Res Function(_$SignUpStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpStateLoadingImpl implements SignUpStateLoading {
  const _$SignUpStateLoadingImpl();

  @override
  String toString() {
    return 'AuthState.signUpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return signUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return signUpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return signUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return signUpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading(this);
    }
    return orElse();
  }
}

abstract class SignUpStateLoading implements AuthState {
  const factory SignUpStateLoading() = _$SignUpStateLoadingImpl;
}

/// @nodoc
abstract class _$$SignUpStateSuccessImplCopyWith<$Res> {
  factory _$$SignUpStateSuccessImplCopyWith(_$SignUpStateSuccessImpl value,
          $Res Function(_$SignUpStateSuccessImpl) then) =
      __$$SignUpStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignUpStateSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignUpStateSuccessImpl>
    implements _$$SignUpStateSuccessImplCopyWith<$Res> {
  __$$SignUpStateSuccessImplCopyWithImpl(_$SignUpStateSuccessImpl _value,
      $Res Function(_$SignUpStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignUpStateSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpStateSuccessImpl implements SignUpStateSuccess {
  const _$SignUpStateSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.signUpSuccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateSuccessImplCopyWith<_$SignUpStateSuccessImpl> get copyWith =>
      __$$SignUpStateSuccessImplCopyWithImpl<_$SignUpStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return signUpSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return signUpSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return signUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return signUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(this);
    }
    return orElse();
  }
}

abstract class SignUpStateSuccess implements AuthState {
  const factory SignUpStateSuccess({required final String message}) =
      _$SignUpStateSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SignUpStateSuccessImplCopyWith<_$SignUpStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpStateErrorImplCopyWith<$Res> {
  factory _$$SignUpStateErrorImplCopyWith(_$SignUpStateErrorImpl value,
          $Res Function(_$SignUpStateErrorImpl) then) =
      __$$SignUpStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? httpStatus, String? message});
}

/// @nodoc
class __$$SignUpStateErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SignUpStateErrorImpl>
    implements _$$SignUpStateErrorImplCopyWith<$Res> {
  __$$SignUpStateErrorImplCopyWithImpl(_$SignUpStateErrorImpl _value,
      $Res Function(_$SignUpStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SignUpStateErrorImpl(
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignUpStateErrorImpl implements SignUpStateError {
  const _$SignUpStateErrorImpl({this.httpStatus, this.message});

  @override
  final int? httpStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.signUpError(httpStatus: $httpStatus, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateErrorImpl &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, httpStatus, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateErrorImplCopyWith<_$SignUpStateErrorImpl> get copyWith =>
      __$$SignUpStateErrorImplCopyWithImpl<_$SignUpStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInLoading,
    required TResult Function(SignInResponse response) signInSuccess,
    required TResult Function(int? httpStatus, String? message) signInError,
    required TResult Function() signUpLoading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(int? httpStatus, String? message) signUpError,
  }) {
    return signUpError(httpStatus, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInLoading,
    TResult? Function(SignInResponse response)? signInSuccess,
    TResult? Function(int? httpStatus, String? message)? signInError,
    TResult? Function()? signUpLoading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(int? httpStatus, String? message)? signUpError,
  }) {
    return signUpError?.call(httpStatus, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInLoading,
    TResult Function(SignInResponse response)? signInSuccess,
    TResult Function(int? httpStatus, String? message)? signInError,
    TResult Function()? signUpLoading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(int? httpStatus, String? message)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpError != null) {
      return signUpError(httpStatus, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(SignInStateLoading value) signInLoading,
    required TResult Function(SignInStateSuccess value) signInSuccess,
    required TResult Function(SignInStateError value) signInError,
    required TResult Function(SignUpStateLoading value) signUpLoading,
    required TResult Function(SignUpStateSuccess value) signUpSuccess,
    required TResult Function(SignUpStateError value) signUpError,
  }) {
    return signUpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(SignInStateLoading value)? signInLoading,
    TResult? Function(SignInStateSuccess value)? signInSuccess,
    TResult? Function(SignInStateError value)? signInError,
    TResult? Function(SignUpStateLoading value)? signUpLoading,
    TResult? Function(SignUpStateSuccess value)? signUpSuccess,
    TResult? Function(SignUpStateError value)? signUpError,
  }) {
    return signUpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(SignInStateLoading value)? signInLoading,
    TResult Function(SignInStateSuccess value)? signInSuccess,
    TResult Function(SignInStateError value)? signInError,
    TResult Function(SignUpStateLoading value)? signUpLoading,
    TResult Function(SignUpStateSuccess value)? signUpSuccess,
    TResult Function(SignUpStateError value)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpError != null) {
      return signUpError(this);
    }
    return orElse();
  }
}

abstract class SignUpStateError implements AuthState {
  const factory SignUpStateError(
      {final int? httpStatus, final String? message}) = _$SignUpStateErrorImpl;

  int? get httpStatus;
  String? get message;
  @JsonKey(ignore: true)
  _$$SignUpStateErrorImplCopyWith<_$SignUpStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageResultSuccess<T> value) success,
    required TResult Function(ImageResultError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageResultSuccess<T> value)? success,
    TResult? Function(ImageResultError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageResultSuccess<T> value)? success,
    TResult Function(ImageResultError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageResultCopyWith<T, $Res> {
  factory $ImageResultCopyWith(
          ImageResult<T> value, $Res Function(ImageResult<T>) then) =
      _$ImageResultCopyWithImpl<T, $Res, ImageResult<T>>;
}

/// @nodoc
class _$ImageResultCopyWithImpl<T, $Res, $Val extends ImageResult<T>>
    implements $ImageResultCopyWith<T, $Res> {
  _$ImageResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImageResultSuccessCopyWith<T, $Res> {
  factory _$$ImageResultSuccessCopyWith(_$ImageResultSuccess<T> value,
          $Res Function(_$ImageResultSuccess<T>) then) =
      __$$ImageResultSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ImageResultSuccessCopyWithImpl<T, $Res>
    extends _$ImageResultCopyWithImpl<T, $Res, _$ImageResultSuccess<T>>
    implements _$$ImageResultSuccessCopyWith<T, $Res> {
  __$$ImageResultSuccessCopyWithImpl(_$ImageResultSuccess<T> _value,
      $Res Function(_$ImageResultSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ImageResultSuccess<T>(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ImageResultSuccess<T> implements ImageResultSuccess<T> {
  const _$ImageResultSuccess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ImageResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageResultSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageResultSuccessCopyWith<T, _$ImageResultSuccess<T>> get copyWith =>
      __$$ImageResultSuccessCopyWithImpl<T, _$ImageResultSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageResultSuccess<T> value) success,
    required TResult Function(ImageResultError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageResultSuccess<T> value)? success,
    TResult? Function(ImageResultError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageResultSuccess<T> value)? success,
    TResult Function(ImageResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ImageResultSuccess<T> implements ImageResult<T> {
  const factory ImageResultSuccess(final T data) = _$ImageResultSuccess<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ImageResultSuccessCopyWith<T, _$ImageResultSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageResultErrorCopyWith<T, $Res> {
  factory _$$ImageResultErrorCopyWith(_$ImageResultError<T> value,
          $Res Function(_$ImageResultError<T>) then) =
      __$$ImageResultErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ImageResultErrorCopyWithImpl<T, $Res>
    extends _$ImageResultCopyWithImpl<T, $Res, _$ImageResultError<T>>
    implements _$$ImageResultErrorCopyWith<T, $Res> {
  __$$ImageResultErrorCopyWithImpl(
      _$ImageResultError<T> _value, $Res Function(_$ImageResultError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ImageResultError<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageResultError<T> implements ImageResultError<T> {
  const _$ImageResultError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ImageResult<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageResultError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageResultErrorCopyWith<T, _$ImageResultError<T>> get copyWith =>
      __$$ImageResultErrorCopyWithImpl<T, _$ImageResultError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageResultSuccess<T> value) success,
    required TResult Function(ImageResultError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageResultSuccess<T> value)? success,
    TResult? Function(ImageResultError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageResultSuccess<T> value)? success,
    TResult Function(ImageResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImageResultError<T> implements ImageResult<T> {
  const factory ImageResultError(final String message) = _$ImageResultError<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$ImageResultErrorCopyWith<T, _$ImageResultError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

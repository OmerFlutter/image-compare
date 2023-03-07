// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageData image) initial,
    required TResult Function() loading,
    required TResult Function(ImageData file) imageLoaded,
    required TResult Function(ImageData fallback, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageData image)? initial,
    TResult? Function()? loading,
    TResult? Function(ImageData file)? imageLoaded,
    TResult? Function(ImageData fallback, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageData image)? initial,
    TResult Function()? loading,
    TResult Function(ImageData file)? imageLoaded,
    TResult Function(ImageData fallback, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageLoading value) loading,
    required TResult Function(ImageLoaded value) imageLoaded,
    required TResult Function(ImageError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageInitial value)? initial,
    TResult? Function(ImageLoading value)? loading,
    TResult? Function(ImageLoaded value)? imageLoaded,
    TResult? Function(ImageError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageLoading value)? loading,
    TResult Function(ImageLoaded value)? imageLoaded,
    TResult Function(ImageError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageStateCopyWith<$Res> {
  factory $ImageStateCopyWith(
          ImageState value, $Res Function(ImageState) then) =
      _$ImageStateCopyWithImpl<$Res, ImageState>;
}

/// @nodoc
class _$ImageStateCopyWithImpl<$Res, $Val extends ImageState>
    implements $ImageStateCopyWith<$Res> {
  _$ImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImageInitialCopyWith<$Res> {
  factory _$$ImageInitialCopyWith(
          _$ImageInitial value, $Res Function(_$ImageInitial) then) =
      __$$ImageInitialCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageData image});

  $ImageDataCopyWith<$Res> get image;
}

/// @nodoc
class __$$ImageInitialCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageInitial>
    implements _$$ImageInitialCopyWith<$Res> {
  __$$ImageInitialCopyWithImpl(
      _$ImageInitial _value, $Res Function(_$ImageInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$ImageInitial(
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res> get image {
    return $ImageDataCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc

class _$ImageInitial implements ImageInitial {
  const _$ImageInitial(this.image);

  @override
  final ImageData image;

  @override
  String toString() {
    return 'ImageState.initial(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageInitial &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageInitialCopyWith<_$ImageInitial> get copyWith =>
      __$$ImageInitialCopyWithImpl<_$ImageInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageData image) initial,
    required TResult Function() loading,
    required TResult Function(ImageData file) imageLoaded,
    required TResult Function(ImageData fallback, String message) error,
  }) {
    return initial(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageData image)? initial,
    TResult? Function()? loading,
    TResult? Function(ImageData file)? imageLoaded,
    TResult? Function(ImageData fallback, String message)? error,
  }) {
    return initial?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageData image)? initial,
    TResult Function()? loading,
    TResult Function(ImageData file)? imageLoaded,
    TResult Function(ImageData fallback, String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageLoading value) loading,
    required TResult Function(ImageLoaded value) imageLoaded,
    required TResult Function(ImageError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageInitial value)? initial,
    TResult? Function(ImageLoading value)? loading,
    TResult? Function(ImageLoaded value)? imageLoaded,
    TResult? Function(ImageError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageLoading value)? loading,
    TResult Function(ImageLoaded value)? imageLoaded,
    TResult Function(ImageError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ImageInitial implements ImageState {
  const factory ImageInitial(final ImageData image) = _$ImageInitial;

  ImageData get image;
  @JsonKey(ignore: true)
  _$$ImageInitialCopyWith<_$ImageInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageLoadingCopyWith<$Res> {
  factory _$$ImageLoadingCopyWith(
          _$ImageLoading value, $Res Function(_$ImageLoading) then) =
      __$$ImageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImageLoadingCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageLoading>
    implements _$$ImageLoadingCopyWith<$Res> {
  __$$ImageLoadingCopyWithImpl(
      _$ImageLoading _value, $Res Function(_$ImageLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImageLoading implements ImageLoading {
  const _$ImageLoading();

  @override
  String toString() {
    return 'ImageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageData image) initial,
    required TResult Function() loading,
    required TResult Function(ImageData file) imageLoaded,
    required TResult Function(ImageData fallback, String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageData image)? initial,
    TResult? Function()? loading,
    TResult? Function(ImageData file)? imageLoaded,
    TResult? Function(ImageData fallback, String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageData image)? initial,
    TResult Function()? loading,
    TResult Function(ImageData file)? imageLoaded,
    TResult Function(ImageData fallback, String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageLoading value) loading,
    required TResult Function(ImageLoaded value) imageLoaded,
    required TResult Function(ImageError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageInitial value)? initial,
    TResult? Function(ImageLoading value)? loading,
    TResult? Function(ImageLoaded value)? imageLoaded,
    TResult? Function(ImageError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageLoading value)? loading,
    TResult Function(ImageLoaded value)? imageLoaded,
    TResult Function(ImageError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ImageLoading implements ImageState {
  const factory ImageLoading() = _$ImageLoading;
}

/// @nodoc
abstract class _$$ImageLoadedCopyWith<$Res> {
  factory _$$ImageLoadedCopyWith(
          _$ImageLoaded value, $Res Function(_$ImageLoaded) then) =
      __$$ImageLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageData file});

  $ImageDataCopyWith<$Res> get file;
}

/// @nodoc
class __$$ImageLoadedCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageLoaded>
    implements _$$ImageLoadedCopyWith<$Res> {
  __$$ImageLoadedCopyWithImpl(
      _$ImageLoaded _value, $Res Function(_$ImageLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$ImageLoaded(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as ImageData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res> get file {
    return $ImageDataCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value));
    });
  }
}

/// @nodoc

class _$ImageLoaded implements ImageLoaded {
  const _$ImageLoaded(this.file);

  @override
  final ImageData file;

  @override
  String toString() {
    return 'ImageState.imageLoaded(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageLoaded &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageLoadedCopyWith<_$ImageLoaded> get copyWith =>
      __$$ImageLoadedCopyWithImpl<_$ImageLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageData image) initial,
    required TResult Function() loading,
    required TResult Function(ImageData file) imageLoaded,
    required TResult Function(ImageData fallback, String message) error,
  }) {
    return imageLoaded(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageData image)? initial,
    TResult? Function()? loading,
    TResult? Function(ImageData file)? imageLoaded,
    TResult? Function(ImageData fallback, String message)? error,
  }) {
    return imageLoaded?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageData image)? initial,
    TResult Function()? loading,
    TResult Function(ImageData file)? imageLoaded,
    TResult Function(ImageData fallback, String message)? error,
    required TResult orElse(),
  }) {
    if (imageLoaded != null) {
      return imageLoaded(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageLoading value) loading,
    required TResult Function(ImageLoaded value) imageLoaded,
    required TResult Function(ImageError value) error,
  }) {
    return imageLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageInitial value)? initial,
    TResult? Function(ImageLoading value)? loading,
    TResult? Function(ImageLoaded value)? imageLoaded,
    TResult? Function(ImageError value)? error,
  }) {
    return imageLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageLoading value)? loading,
    TResult Function(ImageLoaded value)? imageLoaded,
    TResult Function(ImageError value)? error,
    required TResult orElse(),
  }) {
    if (imageLoaded != null) {
      return imageLoaded(this);
    }
    return orElse();
  }
}

abstract class ImageLoaded implements ImageState {
  const factory ImageLoaded(final ImageData file) = _$ImageLoaded;

  ImageData get file;
  @JsonKey(ignore: true)
  _$$ImageLoadedCopyWith<_$ImageLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageErrorCopyWith<$Res> {
  factory _$$ImageErrorCopyWith(
          _$ImageError value, $Res Function(_$ImageError) then) =
      __$$ImageErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageData fallback, String message});

  $ImageDataCopyWith<$Res> get fallback;
}

/// @nodoc
class __$$ImageErrorCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageError>
    implements _$$ImageErrorCopyWith<$Res> {
  __$$ImageErrorCopyWithImpl(
      _$ImageError _value, $Res Function(_$ImageError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fallback = null,
    Object? message = null,
  }) {
    return _then(_$ImageError(
      fallback: null == fallback
          ? _value.fallback
          : fallback // ignore: cast_nullable_to_non_nullable
              as ImageData,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res> get fallback {
    return $ImageDataCopyWith<$Res>(_value.fallback, (value) {
      return _then(_value.copyWith(fallback: value));
    });
  }
}

/// @nodoc

class _$ImageError implements ImageError {
  const _$ImageError({required this.fallback, required this.message});

  @override
  final ImageData fallback;
  @override
  final String message;

  @override
  String toString() {
    return 'ImageState.error(fallback: $fallback, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageError &&
            (identical(other.fallback, fallback) ||
                other.fallback == fallback) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fallback, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageErrorCopyWith<_$ImageError> get copyWith =>
      __$$ImageErrorCopyWithImpl<_$ImageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ImageData image) initial,
    required TResult Function() loading,
    required TResult Function(ImageData file) imageLoaded,
    required TResult Function(ImageData fallback, String message) error,
  }) {
    return error(fallback, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ImageData image)? initial,
    TResult? Function()? loading,
    TResult? Function(ImageData file)? imageLoaded,
    TResult? Function(ImageData fallback, String message)? error,
  }) {
    return error?.call(fallback, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ImageData image)? initial,
    TResult Function()? loading,
    TResult Function(ImageData file)? imageLoaded,
    TResult Function(ImageData fallback, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(fallback, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageInitial value) initial,
    required TResult Function(ImageLoading value) loading,
    required TResult Function(ImageLoaded value) imageLoaded,
    required TResult Function(ImageError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageInitial value)? initial,
    TResult? Function(ImageLoading value)? loading,
    TResult? Function(ImageLoaded value)? imageLoaded,
    TResult? Function(ImageError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageInitial value)? initial,
    TResult Function(ImageLoading value)? loading,
    TResult Function(ImageLoaded value)? imageLoaded,
    TResult Function(ImageError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImageError implements ImageState {
  const factory ImageError(
      {required final ImageData fallback,
      required final String message}) = _$ImageError;

  ImageData get fallback;
  String get message;
  @JsonKey(ignore: true)
  _$$ImageErrorCopyWith<_$ImageError> get copyWith =>
      throw _privateConstructorUsedError;
}

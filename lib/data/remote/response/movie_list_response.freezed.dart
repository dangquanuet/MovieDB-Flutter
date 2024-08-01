// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return _MovieListResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieListResponse {
  int get page => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListResponseCopyWith<MovieListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListResponseCopyWith<$Res> {
  factory $MovieListResponseCopyWith(
          MovieListResponse value, $Res Function(MovieListResponse) then) =
      _$MovieListResponseCopyWithImpl<$Res, MovieListResponse>;
  @useResult
  $Res call({int page, int totalResults, int totalPages, List<Movie> results});
}

/// @nodoc
class _$MovieListResponseCopyWithImpl<$Res, $Val extends MovieListResponse>
    implements $MovieListResponseCopyWith<$Res> {
  _$MovieListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalResults = null,
    Object? totalPages = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListResponseImplCopyWith<$Res>
    implements $MovieListResponseCopyWith<$Res> {
  factory _$$MovieListResponseImplCopyWith(_$MovieListResponseImpl value,
          $Res Function(_$MovieListResponseImpl) then) =
      __$$MovieListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int totalResults, int totalPages, List<Movie> results});
}

/// @nodoc
class __$$MovieListResponseImplCopyWithImpl<$Res>
    extends _$MovieListResponseCopyWithImpl<$Res, _$MovieListResponseImpl>
    implements _$$MovieListResponseImplCopyWith<$Res> {
  __$$MovieListResponseImplCopyWithImpl(_$MovieListResponseImpl _value,
      $Res Function(_$MovieListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalResults = null,
    Object? totalPages = null,
    Object? results = null,
  }) {
    return _then(_$MovieListResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MovieListResponseImpl implements _MovieListResponse {
  const _$MovieListResponseImpl(
      {required this.page,
      required this.totalResults,
      required this.totalPages,
      required final List<Movie> results})
      : _results = results;

  factory _$MovieListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int totalResults;
  @override
  final int totalPages;
  final List<Movie> _results;
  @override
  List<Movie> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MovieListResponse(page: $page, totalResults: $totalResults, totalPages: $totalPages, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalResults, totalPages,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListResponseImplCopyWith<_$MovieListResponseImpl> get copyWith =>
      __$$MovieListResponseImplCopyWithImpl<_$MovieListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListResponseImplToJson(
      this,
    );
  }
}

abstract class _MovieListResponse implements MovieListResponse {
  const factory _MovieListResponse(
      {required final int page,
      required final int totalResults,
      required final int totalPages,
      required final List<Movie> results}) = _$MovieListResponseImpl;

  factory _MovieListResponse.fromJson(Map<String, dynamic> json) =
      _$MovieListResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get totalResults;
  @override
  int get totalPages;
  @override
  List<Movie> get results;
  @override
  @JsonKey(ignore: true)
  _$$MovieListResponseImplCopyWith<_$MovieListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

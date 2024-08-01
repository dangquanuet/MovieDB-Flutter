// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trailer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trailer _$TrailerFromJson(Map<String, dynamic> json) {
  return _Trailer.fromJson(json);
}

/// @nodoc
mixin _$Trailer {
  int get id => throw _privateConstructorUsedError;
  List<Result> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrailerCopyWith<Trailer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrailerCopyWith<$Res> {
  factory $TrailerCopyWith(Trailer value, $Res Function(Trailer) then) =
      _$TrailerCopyWithImpl<$Res, Trailer>;
  @useResult
  $Res call({int id, List<Result> results});
}

/// @nodoc
class _$TrailerCopyWithImpl<$Res, $Val extends Trailer>
    implements $TrailerCopyWith<$Res> {
  _$TrailerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrailerImplCopyWith<$Res> implements $TrailerCopyWith<$Res> {
  factory _$$TrailerImplCopyWith(
          _$TrailerImpl value, $Res Function(_$TrailerImpl) then) =
      __$$TrailerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<Result> results});
}

/// @nodoc
class __$$TrailerImplCopyWithImpl<$Res>
    extends _$TrailerCopyWithImpl<$Res, _$TrailerImpl>
    implements _$$TrailerImplCopyWith<$Res> {
  __$$TrailerImplCopyWithImpl(
      _$TrailerImpl _value, $Res Function(_$TrailerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_$TrailerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrailerImpl implements _Trailer {
  const _$TrailerImpl({required this.id, required final List<Result> results})
      : _results = results;

  factory _$TrailerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrailerImplFromJson(json);

  @override
  final int id;
  final List<Result> _results;
  @override
  List<Result> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'Trailer(id: $id, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrailerImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrailerImplCopyWith<_$TrailerImpl> get copyWith =>
      __$$TrailerImplCopyWithImpl<_$TrailerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrailerImplToJson(
      this,
    );
  }
}

abstract class _Trailer implements Trailer {
  const factory _Trailer(
      {required final int id,
      required final List<Result> results}) = _$TrailerImpl;

  factory _Trailer.fromJson(Map<String, dynamic> json) = _$TrailerImpl.fromJson;

  @override
  int get id;
  @override
  List<Result> get results;
  @override
  @JsonKey(ignore: true)
  _$$TrailerImplCopyWith<_$TrailerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

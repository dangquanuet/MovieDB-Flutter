// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesHash() => r'f6d0ea591b9d4bf77b2a204d88812ac9f79089df';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Movies extends BuildlessAutoDisposeAsyncNotifier<List<Movie>> {
  late final int page;

  FutureOr<List<Movie>> build({
    required int page,
  });
}

/// See also [Movies].
@ProviderFor(Movies)
const moviesProvider = MoviesFamily();

/// See also [Movies].
class MoviesFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [Movies].
  const MoviesFamily();

  /// See also [Movies].
  MoviesProvider call({
    required int page,
  }) {
    return MoviesProvider(
      page: page,
    );
  }

  @override
  MoviesProvider getProviderOverride(
    covariant MoviesProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'moviesProvider';
}

/// See also [Movies].
class MoviesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Movies, List<Movie>> {
  /// See also [Movies].
  MoviesProvider({
    required int page,
  }) : this._internal(
          () => Movies()..page = page,
          from: moviesProvider,
          name: r'moviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moviesHash,
          dependencies: MoviesFamily._dependencies,
          allTransitiveDependencies: MoviesFamily._allTransitiveDependencies,
          page: page,
        );

  MoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  FutureOr<List<Movie>> runNotifierBuild(
    covariant Movies notifier,
  ) {
    return notifier.build(
      page: page,
    );
  }

  @override
  Override overrideWith(Movies Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoviesProvider._internal(
        () => create()..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Movies, List<Movie>> createElement() {
    return _MoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MoviesRef on AutoDisposeAsyncNotifierProviderRef<List<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _MoviesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Movies, List<Movie>>
    with MoviesRef {
  _MoviesProviderElement(super.provider);

  @override
  int get page => (origin as MoviesProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

class Movie {
  final int voteCount;
  final voteAverage;
  final String id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  bool isFavorite;

  Movie({
    this.voteCount,
    this.voteAverage,
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.isFavorite = false,
  });

  Movie.fromJson(Map<String, dynamic> map)
      : voteCount = map['vote_count'],
        voteAverage = map['vote_average'],
        id = map['id'].toString(),
        title = map['title'],
        overview = map['overview'],
        releaseDate = map['release_date'],
        posterPath = map['poster_path'],
        backdropPath = map['backdrop_path'],
        isFavorite = false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'title': title,
        'overview': overview,
        'release_date': releaseDate,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
      };
}

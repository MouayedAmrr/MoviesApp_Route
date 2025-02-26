class ApiResponse {
  final String status;
  final String statusMessage;
  final MovieData data;

  ApiResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: MovieData.fromJson(json['data']),
    );
  }
}

class MovieData {
  final int movieCount;
  final List<Movie> movies;

  MovieData({
    required this.movieCount,
    required this.movies,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
      movieCount: json['movie_count'],
      movies: (json['movies'] as List<dynamic>?)
          ?.map((movieJson) => Movie.fromJson(movieJson))
          .toList() ??
          [],
    );
  }
}

class Movie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String summary;
  final String backgroundImage;
  final String coverImage;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.backgroundImage,
    required this.coverImage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'] ?? 0,
      genres: List<String>.from(json['genres'] ?? []),
      summary: json['summary'] ?? "No summary available",
      backgroundImage: json['background_image'] ?? "",
      coverImage: json['medium_cover_image'] ?? "",
    );
  }
}

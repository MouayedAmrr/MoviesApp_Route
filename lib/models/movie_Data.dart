class MoviesHomeDataModel {
  MoviesHomeDataModel({
    required this.movies,
  });

  final List<Movie> movies;

  factory MoviesHomeDataModel.fromJson(Map<String, dynamic> json) {
    return MoviesHomeDataModel(
      movies: json["data"] != null && json["data"]["movies"] != null
          ? List<Movie>.from(json["data"]["movies"].map((x) => Movie.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    "movies": movies.map((x) => x.toJson()).toList(),
  };
}

class Movie {
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

  final String id;
  final String title;
  final String year;
  final String rating;
  final String runtime;
  final List<String> genres;
  final String summary;
  final String backgroundImage;
  final String coverImage;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"].toString(),
      title: json['title'] ?? "Unknown",
      year: json['year']?.toString() ?? "N/A",
      rating: json['rating']?.toString() ?? "0.0",
      runtime: json['runtime']?.toString() ?? "Unknown",
      genres: List<String>.from(json['genres'] ?? []), // Handle null case
      summary: json['summary'] ?? "No summary available",
      backgroundImage: json['background_image'] ?? "",
      coverImage: json['medium_cover_image'] ?? "",
    );
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "year": year,
    "rating": rating,
    "runtime": runtime,
    "genres": genres,
    "summary": summary,
    "background_image": backgroundImage,
    "cover_image": coverImage,
  };
}

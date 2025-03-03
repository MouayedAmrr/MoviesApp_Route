class ApiResponse{
  final String status;
  //final String status_message;
  final List<Movie> movies;

  ApiResponse({required this.status, required this.movies});

  factory ApiResponse.fromjson(Map<String, dynamic> json) {
    return ApiResponse(status: json['status'] ,
        movies: (json['data']['movies'] as List<dynamic>?)
            ?.map((movieJson) => Movie.fromjson(movieJson))
            .toList() ??
            [],
    );
  }
}

class Movie {

  final String id;
  //final String url;
  final String title;
  final String year;
  final String rating;
  final String runtime;
  final List<String> genres;
  final String summary;
  final String backgroundImage;
  final String coverImage;

  Movie({required this.id, required this.title, required this.year, required this.rating, required this.runtime, required this.genres, required this.summary, required this.backgroundImage, required this.coverImage});

  factory Movie.fromjson(Map<String, dynamic> json){
    return Movie(
        id: json["id"],
        title: json['title'],
        year: json['year'],
        rating: json['rating'],
        runtime: json['runtime'],
        genres: List<String>.from(json['genres']),
        summary: json['summary'],
        backgroundImage: json['background_image'] ,
        coverImage: json['medium_cover_image']
    );
  }

}
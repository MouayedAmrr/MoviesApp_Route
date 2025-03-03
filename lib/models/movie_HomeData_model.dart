//Movie Model For the Home Screen



class MovieHomeData {
  final String id;
 // final String title;
  final String image;
  final String rating;

  MovieHomeData({
    required this.id,
    //required this.title,
    required this.image,
    required this.rating,
  });

  factory MovieHomeData.fromjson(Map<String, dynamic> json)
  {
    return MovieHomeData(
        id: json["id"],
       // title: json["title"],
        image: json["medium_cover_image"],
        rating: json["rating"]
    );
  }
}

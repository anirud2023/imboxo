class MovieCollectionModel {
  MovieCollectionModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  final int? status;
  final int? success;
  final String? message;
  final Data? data;

  factory MovieCollectionModel.fromJson(Map<String, dynamic> json){
    return MovieCollectionModel(
      status: json["status"],
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $success, $message, $data, ";
  }
}

class Data {
  Data({
    required this.genre,
    required this.festival,
    required this.latestReleases,
    required this.featuredMovies,
    required this.trendingNow,
    required this.topPickWeek,
    required this.bannerMovie,
    required this.recommendationMovies,
    required this.payPerView,
    required this.buy,
  });

  final Genre? genre;
  final Festival? festival;
  final List<BannerMovie> latestReleases;
  final List<BannerMovie> featuredMovies;
  final List<dynamic> trendingNow;
  final List<BannerMovie> topPickWeek;
  final BannerMovie? bannerMovie;
  final List<BannerMovie> recommendationMovies;
  final List<BannerMovie> payPerView;
  final List<BannerMovie> buy;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      genre: json["genre"] == null ? null : Genre.fromJson(json["genre"]),
      festival: json["festival"] == null ? null : Festival.fromJson(json["festival"]),
      latestReleases: json["latest_releases"] == null ? [] : List<BannerMovie>.from(json["latest_releases"]!.map((x) => BannerMovie.fromJson(x))),
      featuredMovies: json["featured_movies"] == null ? [] : List<BannerMovie>.from(json["featured_movies"]!.map((x) => BannerMovie.fromJson(x))),
      trendingNow: json["trending_now"] == null ? [] : List<dynamic>.from(json["trending_now"]!.map((x) => x)),
      topPickWeek: json["top_pick_week"] == null ? [] : List<BannerMovie>.from(json["top_pick_week"]!.map((x) => BannerMovie.fromJson(x))),
      bannerMovie: json["banner_movie"] == null ? null : BannerMovie.fromJson(json["banner_movie"]),
      recommendationMovies: json["recommendation_movies"] == null ? [] : List<BannerMovie>.from(json["recommendation_movies"]!.map((x) => BannerMovie.fromJson(x))),
      payPerView: json["pay_per_view"] == null ? [] : List<BannerMovie>.from(json["pay_per_view"]!.map((x) => BannerMovie.fromJson(x))),
      buy: json["buy"] == null ? [] : List<BannerMovie>.from(json["buy"]!.map((x) => BannerMovie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "genre": genre?.toJson(),
    "festival": festival?.toJson(),
    "latest_releases": latestReleases.map((x) => x?.toJson()).toList(),
    "featured_movies": featuredMovies.map((x) => x?.toJson()).toList(),
    "trending_now": trendingNow.map((x) => x).toList(),
    "top_pick_week": topPickWeek.map((x) => x?.toJson()).toList(),
    "banner_movie": bannerMovie?.toJson(),
    "recommendation_movies": recommendationMovies.map((x) => x?.toJson()).toList(),
    "pay_per_view": payPerView.map((x) => x?.toJson()).toList(),
    "buy": buy.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$genre, $festival, $latestReleases, $featuredMovies, $trendingNow, $topPickWeek, $bannerMovie, $recommendationMovies, $payPerView, $buy, ";
  }
}

class BannerMovie {
  BannerMovie({
    required this.id,
    required this.name,
    required this.slug,
    required this.access,
    required this.thumbnail,
    required this.poster,
    required this.hashThumbnail,
    required this.hashPoster,
    required this.releaseDate,
    required this.duration,
    required this.certificate,
    required this.favorite,
    required this.topPickWeekPosition,
    required this.featuredPosition,
    required this.recommendationsPosition,
    required this.genreList,
    required this.festivalList,
    required this.language,
    required this.userListPayPerView,
    required this.userListBuy,
  });

  final int? id;
  final String? name;
  final String? slug;
  final List<String> access;
  final String? thumbnail;
  final String? poster;
  final String? hashThumbnail;
  final String? hashPoster;
  final int? releaseDate;
  final String? duration;
  final String? certificate;
  final bool? favorite;
  final String? topPickWeekPosition;
  final dynamic featuredPosition;
  final dynamic recommendationsPosition;
  final List<String> genreList;
  final List<String> festivalList;
  final List<Language> language;
  final List<dynamic> userListPayPerView;
  final List<Language> userListBuy;

  factory BannerMovie.fromJson(Map<String, dynamic> json){
    return BannerMovie(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      access: json["access"] == null ? [] : List<String>.from(json["access"]!.map((x) => x)),
      thumbnail: json["thumbnail"],
      poster: json["poster"],
      hashThumbnail: json["hash_thumbnail"],
      hashPoster: json["hash_poster"],
      releaseDate: json["release_date"],
      duration: json["duration"],
      certificate: json["certificate"],
      favorite: json["favorite"],
      topPickWeekPosition: json["top_pick_week_position"],
      featuredPosition: json["featured_position"],
      recommendationsPosition: json["recommendations_position"],
      genreList: json["genreList"] == null ? [] : List<String>.from(json["genreList"]!.map((x) => x)),
      festivalList: json["festivalList"] == null ? [] : List<String>.from(json["festivalList"]!.map((x) => x)),
      language: json["language"] == null ? [] : List<Language>.from(json["language"]!.map((x) => Language.fromJson(x))),
      userListPayPerView: json["userListPayPerView"] == null ? [] : List<dynamic>.from(json["userListPayPerView"]!.map((x) => x)),
      userListBuy: json["userListBuy"] == null ? [] : List<Language>.from(json["userListBuy"]!.map((x) => Language.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "access": access.map((x) => x).toList(),
    "thumbnail": thumbnail,
    "poster": poster,
    "hash_thumbnail": hashThumbnail,
    "hash_poster": hashPoster,
    "release_date": releaseDate,
    "duration": duration,
    "certificate": certificate,
    "favorite": favorite,
    "top_pick_week_position": topPickWeekPosition,
    "featured_position": featuredPosition,
    "recommendations_position": recommendationsPosition,
    "genreList": genreList.map((x) => x).toList(),
    "festivalList": festivalList.map((x) => x).toList(),
    "language": language.map((x) => x?.toJson()).toList(),
    "userListPayPerView": userListPayPerView.map((x) => x).toList(),
    "userListBuy": userListBuy.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$id, $name, $slug, $access, $thumbnail, $poster, $hashThumbnail, $hashPoster, $releaseDate, $duration, $certificate, $favorite, $topPickWeekPosition, $featuredPosition, $recommendationsPosition, $genreList, $festivalList, $language, $userListPayPerView, $userListBuy, ";
  }
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Language.fromJson(Map<String, dynamic> json){
    return Language(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  @override
  String toString(){
    return "$id, $name, ";
  }
}

class Festival {
  Festival({
    required this.aiFilmFestRound1,
  });

  final List<BannerMovie> aiFilmFestRound1;

  factory Festival.fromJson(Map<String, dynamic> json){
    return Festival(
      aiFilmFestRound1: json["AI FILM FEST ROUND 1"] == null ? [] : List<BannerMovie>.from(json["AI FILM FEST ROUND 1"]!.map((x) => BannerMovie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "AI FILM FEST ROUND 1": aiFilmFestRound1.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$aiFilmFestRound1, ";
  }
}

class Genre {
  Genre({
    required this.lifeUfiction,
    required this.aiFilmFest,
  });

  final List<BannerMovie> lifeUfiction;
  final List<BannerMovie> aiFilmFest;

  factory Genre.fromJson(Map<String, dynamic> json){
    return Genre(
      lifeUfiction: json["LifeUfiction"] == null ? [] : List<BannerMovie>.from(json["LifeUfiction"]!.map((x) => BannerMovie.fromJson(x))),
      aiFilmFest: json["AI FILM FEST"] == null ? [] : List<BannerMovie>.from(json["AI FILM FEST"]!.map((x) => BannerMovie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "LifeUfiction": lifeUfiction.map((x) => x?.toJson()).toList(),
    "AI FILM FEST": aiFilmFest.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$lifeUfiction, $aiFilmFest, ";
  }
}

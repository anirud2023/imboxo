class AllMovieCollectionModel {
  AllMovieCollectionModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  final int? status;
  final int? success;
  final String? message;
  final List<Datum> data;

  factory AllMovieCollectionModel.fromJson(Map<String, dynamic> json){
    return AllMovieCollectionModel(
      status: json["status"],
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$status, $success, $message, $data, ";
  }
}

class Datum {
  Datum({
    required this.id,
    required this.access,
    required this.name,
    required this.slug,
    required this.thumbnail,
    required this.poster,
    required this.hashThumbnail,
    required this.hashPoster,
    required this.releaseDate,
    required this.duration,
    required this.certificate,
    required this.favorite,
  });

  final int? id;
  final List<String> access;
  final String? name;
  final String? slug;
  final String? thumbnail;
  final String? poster;
  final String? hashThumbnail;
  final String? hashPoster;
  final int? releaseDate;
  final String? duration;
  final String? certificate;
  final bool? favorite;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      access: json["access"] == null ? [] : List<String>.from(json["access"]!.map((x) => x)),
      name: json["name"],
      slug: json["slug"],
      thumbnail: json["thumbnail"],
      poster: json["poster"],
      hashThumbnail: json["hash_thumbnail"],
      hashPoster: json["hash_poster"],
      releaseDate: json["release_date"],
      duration: json["duration"],
      certificate: json["certificate"],
      favorite: json["favorite"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "access": access.map((x) => x).toList(),
    "name": name,
    "slug": slug,
    "thumbnail": thumbnail,
    "poster": poster,
    "hash_thumbnail": hashThumbnail,
    "hash_poster": hashPoster,
    "release_date": releaseDate,
    "duration": duration,
    "certificate": certificate,
    "favorite": favorite,
  };

  @override
  String toString(){
    return "$id, $access, $name, $slug, $thumbnail, $poster, $hashThumbnail, $hashPoster, $releaseDate, $duration, $certificate, $favorite, ";
  }
}

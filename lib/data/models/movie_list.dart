import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

String movieListToJson(MovieList data) => json.encode(data.toJson());

class MovieList {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    MovieList({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory MovieList.fromJson(Map<String, dynamic> json) => new MovieList(
        page: json["page"],
        results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    OriginalLanguage originalLanguage;
    String originalTitle;
    String overview;
    String posterPath;
    DateTime releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;
    double popularity;
    DateTime firstAirDate;
    String name;
    List<String> originCountry;
    String originalName;

    Result({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.popularity,
        this.firstAirDate,
        this.name,
        this.originCountry,
        this.originalName,
    });

    factory Result.fromJson(Map<String, dynamic> json) => new Result(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        popularity: json["popularity"].toDouble(),
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null ? null : new List<String>.from(json["origin_country"].map((x) => x)),
        originalName: json["original_name"] == null ? null : json["original_name"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath,
        "genre_ids": new List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "popularity": popularity,
        "first_air_date": firstAirDate == null ? null : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "name": name == null ? null : name,
        "origin_country": originCountry == null ? null : new List<dynamic>.from(originCountry.map((x) => x)),
        "original_name": originalName == null ? null : originalName,
    };
}

enum OriginalLanguage { EN }

final originalLanguageValues = new EnumValues({
    "en": OriginalLanguage.EN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

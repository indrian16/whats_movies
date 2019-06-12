import 'dart:convert';

PeopleList peopleListFromJson(String str) => PeopleList.fromJson(json.decode(str));

String peopleListToJson(PeopleList data) => json.encode(data.toJson());

class PeopleList {
    int page;
    int totalResults;
    int totalPages;
    List<Result> results;

    PeopleList({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    factory PeopleList.fromJson(Map<String, dynamic> json) => new PeopleList(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    double popularity;
    int id;
    String profilePath;
    String name;
    List<KnownFor> knownFor;
    bool adult;

    Result({
        this.popularity,
        this.id,
        this.profilePath,
        this.name,
        this.knownFor,
        this.adult,
    });

    factory Result.fromJson(Map<String, dynamic> json) => new Result(
        popularity: json["popularity"].toDouble() ?? 0.0,
        id: json["id"] ?? null,
        profilePath: json["profile_path"] ?? '',
        name: json["name"] ?? '',
        knownFor: new List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))) ?? [],
        adult: json["adult"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "id": id,
        "profile_path": profilePath,
        "name": name,
        "known_for": new List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "adult": adult,
    };
}

class KnownFor {
    double voteAverage;
    int voteCount;
    int id;
    bool video;
    MediaType mediaType;
    String title;
    double popularity;
    String posterPath;
    OriginalLanguage originalLanguage;
    String originalTitle;
    List<int> genreIds;
    String backdropPath;
    bool adult;
    String overview;
    DateTime releaseDate;
    String originalName;
    String name;
    DateTime firstAirDate;
    List<String> originCountry;

    KnownFor({
        this.voteAverage,
        this.voteCount,
        this.id,
        this.video,
        this.mediaType,
        this.title,
        this.popularity,
        this.posterPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.backdropPath,
        this.adult,
        this.overview,
        this.releaseDate,
        this.originalName,
        this.name,
        this.firstAirDate,
        this.originCountry,
    });

    factory KnownFor.fromJson(Map<String, dynamic> json) => new KnownFor(
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        id: json["id"],
        video: json["video"] == null ? null : json["video"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        title: json["title"] == null ? null : json["title"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
        backdropPath: json["backdrop_path"],
        adult: json["adult"] == null ? null : json["adult"],
        overview: json["overview"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        originalName: json["original_name"] == null ? null : json["original_name"],
        name: json["name"] == null ? null : json["name"],
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null ? null : new List<String>.from(json["origin_country"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "id": id,
        "video": video == null ? null : video,
        "media_type": mediaTypeValues.reverse[mediaType],
        "title": title == null ? null : title,
        "popularity": popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "genre_ids": new List<dynamic>.from(genreIds.map((x) => x)),
        "backdrop_path": backdropPath,
        "adult": adult == null ? null : adult,
        "overview": overview,
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "original_name": originalName == null ? null : originalName,
        "name": name == null ? null : name,
        "first_air_date": firstAirDate == null ? null : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null ? null : new List<dynamic>.from(originCountry.map((x) => x)),
    };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues = new EnumValues({
    "movie": MediaType.MOVIE,
    "tv": MediaType.TV
});

enum OriginalLanguage { EN, CN, JA, HI, FR }

final originalLanguageValues = new EnumValues({
    "cn": OriginalLanguage.CN,
    "en": OriginalLanguage.EN,
    "fr": OriginalLanguage.FR,
    "hi": OriginalLanguage.HI,
    "ja": OriginalLanguage.JA
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
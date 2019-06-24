import 'dart:convert';
import 'movie_detail_enum.dart';

MovieDetailVideo movieDetailVideoFromJson(String str) => MovieDetailVideo.fromJson(json.decode(str));

String movieDetailVideoToJson(MovieDetailVideo data) => json.encode(data.toJson());

class MovieDetailVideo {
    int id;
    List<Result> results;

    MovieDetailVideo({
        this.id,
        this.results,
    });

    factory MovieDetailVideo.fromJson(Map<String, dynamic> json) => new MovieDetailVideo(
        id: json["id"],
        results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String id;
    Iso6391 iso6391;
    Iso31661 iso31661;
    String key;
    String name;
    Site site;
    int size;
    Type type;

    Result({
        this.id,
        this.iso6391,
        this.iso31661,
        this.key,
        this.name,
        this.site,
        this.size,
        this.type,
    });

    factory Result.fromJson(Map<String, dynamic> json) => new Result(
        id: json["id"],
        iso6391: iso6391Values.map[json["iso_639_1"]],
        iso31661: iso31661Values.map[json["iso_3166_1"]],
        key: json["key"],
        name: json["name"],
        site: siteValues.map[json["site"]],
        size: json["size"],
        type: typeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "iso_639_1": iso6391Values.reverse[iso6391],
        "iso_3166_1": iso31661Values.reverse[iso31661],
        "key": key,
        "name": name,
        "site": siteValues.reverse[site],
        "size": size,
        "type": typeValues.reverse[type],
    };
}

enum Iso31661 { US }

final iso31661Values = new EnumValues({
    "US": Iso31661.US
});

enum Iso6391 { EN }

final iso6391Values = new EnumValues({
    "en": Iso6391.EN
});

final siteValues = new EnumValues({
    "YouTube": Site.YOU_TUBE
});

final typeValues = new EnumValues({
    "Behind the Scenes": Type.BEHIND_THE_SCENES,
    "Clip": Type.CLIP,
    "Featurette": Type.FEATURETTE,
    "Teaser": Type.TEASER,
    "Trailer": Type.TRAILER
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

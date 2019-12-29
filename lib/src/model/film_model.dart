import 'package:flutter/material.dart';

class Films {
  List<Film> items = new List();

  Films();

  Films.fromJsonList( List<dynamic> jsonList ) {
    if (jsonList == null) return;
    for ( var item in jsonList ) {
      final film = new Film.fromJsonMap(item);
      items.add(film);
    }
  }
}

class Film {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  DateTime releaseDate;

  Film({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Film.fromJsonMap( Map<String, dynamic> json) {
    popularity        = json["popularity"].toDouble();
    voteCount         = json["vote_count"];
    video             = json["video"];
    posterPath        = json["poster_path"];
    id                = json["id"];
    adult             = json["adult"];
    backdropPath      = json["backdrop_path"];
    originalLanguage  = json["original_language"];
    originalTitle     = json["original_title"];
    genreIds          = List<int>.from(json["genre_ids"].map((x) => x));
    title             = json["title"];
    voteAverage       = json["vote_average"].toDouble();
    overview          = json["overview"];
    releaseDate       = DateTime.parse(json["release_date"]);
  }

  getPosterImage() {
    return posterPath == null ? AssetImage('assets/no-image.jpg') : 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getBackgroundImage() {
    return posterPath == null ? AssetImage('assets/no-image.jpg') : 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
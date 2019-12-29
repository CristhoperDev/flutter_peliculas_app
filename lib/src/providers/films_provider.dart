import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas_futter_app/src/model/film_model.dart';

class FilmsProvider {
  String _apiKey = '6267fde48dfd7f8864b03ba31e948fbe';
  String _url = 'api.themoviedb.org';
  String _language = 'es-PE';
  int _popularPage = 0;

  List<Film> _populars = new List();

  final _popularsStreamController = StreamController< List<Film> >.broadcast();

  Function(List<Film>) get popularSink => _popularsStreamController.sink.add;

  Stream< List<Film> > get popularStream => _popularsStreamController.stream;

  void disposeStream() {
    _popularsStreamController?.close();
  }

  Future<List<Film>> _processResponse (Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final films = new Films.fromJsonList(decodedData['results']);

    return films.items;
  }

  Future< List<Film> > getOnCinemas() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'   : _apiKey,
      'language'  : _language,
    });

    return _processResponse(url);
  }

  Future< List<Film> > getPopulars() async {
    _popularPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'     : _popularPage.toString(),
    });

    final resp = await _processResponse(url);
    _populars.addAll(resp);
    popularSink(_populars);

    return resp;
  }
}
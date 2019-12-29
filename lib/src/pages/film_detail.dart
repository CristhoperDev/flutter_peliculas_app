import 'package:flutter/material.dart';
import 'package:peliculas_futter_app/src/model/film_model.dart';

class FilmDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Film film = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(child: Text(film.title)),
    );
  }
}

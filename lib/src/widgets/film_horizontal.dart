import 'package:flutter/material.dart';
import 'package:peliculas_futter_app/src/model/film_model.dart';

class FilmHorizontal extends StatelessWidget {
  final List<Film> films;

  FilmHorizontal({@required this.films});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.28,
      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(BuildContext context) {
    return films.map((film) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(film.getPosterImage()),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              film.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}

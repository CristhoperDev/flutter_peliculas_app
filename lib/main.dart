import 'package:flutter/material.dart';
import 'package:peliculas_futter_app/src/pages/film_detail.dart';
import 'package:peliculas_futter_app/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/'         : (context) => HomePage(),
        '/detalle'  : (context) =>FilmDetail(),
      },
    );
  }
}

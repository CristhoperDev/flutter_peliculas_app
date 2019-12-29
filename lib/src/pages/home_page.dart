import 'package:flutter/material.dart';
import 'package:peliculas_futter_app/src/providers/films_provider.dart';
import 'package:peliculas_futter_app/src/widgets/card_swiper_widget.dart';
import 'package:peliculas_futter_app/src/widgets/film_horizontal.dart';

class HomePage extends StatelessWidget {
  final filmsProvider = new FilmsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
            _footer(context)
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: filmsProvider.getOnCinemas(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        return snapshot.hasData ? CardSwiper(films: snapshot.data) : Container( height: 400.0, child: Center( child: CircularProgressIndicator() ));
      }
    );
  }
  
  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead),
          ),
          SizedBox(height: 5.0),
          FutureBuilder(
            future: filmsProvider.getPopulars(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              return snapshot.hasData ? FilmHorizontal(films: snapshot.data) : CircularProgressIndicator();
            }
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:peliculas_futter_app/src/providers/films_provider.dart';
import 'package:peliculas_futter_app/src/widgets/card_swiper_widget.dart';

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
          children: <Widget>[
            _swiperCards()
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: filmsProvider.getOnCinemas(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(films: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      }
    );

    /*filmsProvider.getOnCinemas();
    return CardSwiper(
      films: [1,2,3,4,5],
    );*/
  }
}

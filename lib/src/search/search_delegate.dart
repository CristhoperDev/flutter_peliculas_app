import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String selection = '';

  final films = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    'Superman',
    'Ironman 1',
    'Ironman 2',
    'Ironman 3',
  ];

  final recentFilms = [
    'Spiderman',
    'Capitan America',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Appbar actions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //start Appbar Icon
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // create results that you show
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // it is suggestion when people wrote
    final suggestedList = (query.isEmpty) ? recentFilms : films.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestedList.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(suggestedList[i]),
          onTap: () {
            selection = suggestedList[i];
            showResults(context);
          },
        );
      },
    );
  }

}

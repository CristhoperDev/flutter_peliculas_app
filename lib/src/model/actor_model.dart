class Cast {
  List<Actor> actors = new List();
  Cast.fromJsonList( List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach( (item) {
      final actor = Actor.fromJson(item);
      actors.add(actor);
    });

  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
    castId      : json["cast_id"],
    character   : json["character"],
    creditId    : json["credit_id"],
    gender      : json["gender"],
    id          : json["id"],
    name        : json["name"],
    order       : json["order"],
    profilePath : json["profile_path"] == null ? null : json["profile_path"],
  );

  getPhoto() {
    return profilePath == null ? 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg' : 'https://image.tmdb.org/t/p/w500/$profilePath';
  }

}
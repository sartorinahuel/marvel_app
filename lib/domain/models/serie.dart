import 'next.dart';
import 'previous.dart';
import 'characters.dart';
import 'comics.dart';
import 'creators.dart';
import 'events.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'urls.dart';

class Serie {
  int id;
  String title;
  dynamic description;
  String resourceUri;
  List<Urls> urls;
  int startYear;
  int endYear;
  String rating;
  String type;
  String modified;
  Thumbnail thumbnail;
  Creators creators;
  Characters characters;
  Stories stories;
  Comics comics;
  Events events;
  Next next;
  Previous previous;

  Serie(
      {this.id,
      this.title,
      this.description,
      this.resourceUri,
      this.urls,
      this.startYear,
      this.endYear,
      this.rating,
      this.type,
      this.modified,
      this.thumbnail,
      this.creators,
      this.characters,
      this.stories,
      this.comics,
      this.events,
      this.next,
      this.previous});

  Serie.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["description"] is String) this.description = json["description"];
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
    if (json["urls"] is List)
      this.urls = json["urls"] == null ? [] : (json["urls"] as List).map((e) => Urls.fromJson(e)).toList();
    if (json["startYear"] is int) this.startYear = json["startYear"];
    if (json["endYear"] is int) this.endYear = json["endYear"];
    if (json["rating"] is String) this.rating = json["rating"];
    if (json["type"] is String) this.type = json["type"];
    if (json["modified"] is String) this.modified = json["modified"];
    if (json["thumbnail"] is Map) this.thumbnail = json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]);
    if (json["creators"] is Map) this.creators = json["creators"] == null ? null : Creators.fromJson(json["creators"]);
    if (json["characters"] is Map) this.characters = json["characters"] == null ? null : Characters.fromJson(json["characters"]);
    if (json["stories"] is Map) this.stories = json["stories"] == null ? null : Stories.fromJson(json["stories"]);
    if (json["comics"] is Map) this.comics = json["comics"] == null ? null : Comics.fromJson(json["comics"]);
    if (json["events"] is Map) this.events = json["events"] == null ? null : Events.fromJson(json["events"]);
    if (json["next"] is Map) this.next = json["next"] == null ? null : Next.fromJson(json["next"]);
    if (json["previous"] is Map) this.previous = json["previous"] == null ? null : Previous.fromJson(json["previous"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["description"] = this.description;
    data["resourceURI"] = this.resourceUri;
    if (this.urls != null) data["urls"] = this.urls.map((e) => e.toJson()).toList();
    data["startYear"] = this.startYear;
    data["endYear"] = this.endYear;
    data["rating"] = this.rating;
    data["type"] = this.type;
    data["modified"] = this.modified;
    if (this.thumbnail != null) data["thumbnail"] = this.thumbnail.toJson();
    if (this.creators != null) data["creators"] = this.creators.toJson();
    if (this.characters != null) data["characters"] = this.characters.toJson();
    if (this.stories != null) data["stories"] = this.stories.toJson();
    if (this.comics != null) data["comics"] = this.comics.toJson();
    if (this.events != null) data["events"] = this.events.toJson();
    data["next"] = this.next;
    data["previous"] = this.previous;
    return data;
  }
}

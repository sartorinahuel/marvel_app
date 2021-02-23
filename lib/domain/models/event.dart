import 'characters.dart';
import 'comics.dart';
import 'creators.dart';
import 'next.dart';
import 'previous.dart';
import 'series.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'urls.dart';

class Event {
  int id;
  String title;
  String description;
  String resourceUri;
  List<Urls> urls;
  String modified;
  String start;
  String end;
  Thumbnail thumbnail;
  Creators creators;
  Characters characters;
  Stories stories;
  Comics comics;
  Series series;
  Next next;
  Previous previous;

  Event(
      {this.id,
      this.title,
      this.description,
      this.resourceUri,
      this.urls,
      this.modified,
      this.start,
      this.end,
      this.thumbnail,
      this.creators,
      this.characters,
      this.stories,
      this.comics,
      this.series,
      this.next,
      this.previous});

  Event.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["description"] is String) this.description = json["description"];
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
    if (json["urls"] is List)
      this.urls = json["urls"] == null ? [] : (json["urls"] as List).map((e) => Urls.fromJson(e)).toList();
    if (json["modified"] is String) this.modified = json["modified"];
    if (json["start"] is String) this.start = json["start"];
    if (json["end"] is String) this.end = json["end"];
    if (json["thumbnail"] is Map) this.thumbnail = json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]);
    if (json["creators"] is Map) this.creators = json["creators"] == null ? null : Creators.fromJson(json["creators"]);
    if (json["characters"] is Map) this.characters = json["characters"] == null ? null : Characters.fromJson(json["characters"]);
    if (json["stories"] is Map) this.stories = json["stories"] == null ? null : Stories.fromJson(json["stories"]);
    if (json["comics"] is Map) this.comics = json["comics"] == null ? null : Comics.fromJson(json["comics"]);
    if (json["series"] is Map) this.series = json["series"] == null ? null : Series.fromJson(json["series"]);
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
    data["modified"] = this.modified;
    data["start"] = this.start;
    data["end"] = this.end;
    if (this.thumbnail != null) data["thumbnail"] = this.thumbnail.toJson();
    if (this.creators != null) data["creators"] = this.creators.toJson();
    if (this.characters != null) data["characters"] = this.characters.toJson();
    if (this.stories != null) data["stories"] = this.stories.toJson();
    if (this.comics != null) data["comics"] = this.comics.toJson();
    if (this.series != null) data["series"] = this.series.toJson();
    if (this.next != null) data["next"] = this.next.toJson();
    if (this.previous != null) data["previous"] = this.previous.toJson();
    return data;
  }
}

import 'characters.dart';
import 'comics.dart';
import 'creators.dart';
import 'events.dart';
import 'series.dart';
import 'thumbnail.dart';

class Story {
  int id;
  String title;
  String description;
  String resourceUri;
  String type;
  String modified;
  Thumbnail thumbnail;
  Creators creators;
  Characters characters;
  Series series;
  Comics comics;
  Events events;
  ComicItem originalIssue;

  Story(
      {this.id,
      this.title,
      this.description,
      this.resourceUri,
      this.type,
      this.modified,
      this.thumbnail,
      this.creators,
      this.characters,
      this.series,
      this.comics,
      this.events,
      this.originalIssue});

  Story.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["description"] is String) this.description = json["description"];
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
    if (json["type"] is String) this.type = json["type"];
    if (json["modified"] is String) this.modified = json["modified"];
    if (json["thumbnail"] is Map) this.thumbnail = json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]);
    if (json["creators"] is Map) this.creators = json["creators"] == null ? null : Creators.fromJson(json["creators"]);
    if (json["characters"] is Map) this.characters = json["characters"] == null ? null : Characters.fromJson(json["characters"]);
    if (json["series"] is Map) this.series = json["series"] == null ? null : Series.fromJson(json["series"]);
    if (json["comics"] is Map) this.comics = json["comics"] == null ? null : Comics.fromJson(json["comics"]);
    if (json["events"] is Map) this.events = json["events"] == null ? null : Events.fromJson(json["events"]);
    if (json["originalIssue"] is Map)
      this.originalIssue = json["originalIssue"] == null ? null : ComicItem.fromJson(json["originalIssue"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["description"] = this.description;
    data["resourceURI"] = this.resourceUri;
    data["type"] = this.type;
    data["modified"] = this.modified;
    data["thumbnail"] = this.thumbnail;
    if (this.creators != null) data["creators"] = this.creators.toJson();
    if (this.characters != null) data["characters"] = this.characters.toJson();
    if (this.series != null) data["series"] = this.series.toJson();
    if (this.comics != null) data["comics"] = this.comics.toJson();
    if (this.events != null) data["events"] = this.events.toJson();
    if (this.originalIssue != null) data["originalIssue"] = this.originalIssue.toJson();
    return data;
  }
}

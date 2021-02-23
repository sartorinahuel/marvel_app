import 'comics.dart';
import 'events.dart';
import 'series.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'urls.dart';

class Creator {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String suffix;
  String fullName;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  Comics comics;
  Series series;
  Stories stories;
  Events events;
  List<Urls> urls;

  Creator(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.suffix,
      this.fullName,
      this.modified,
      this.thumbnail,
      this.resourceUri,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls});

  Creator.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["firstName"] is String) this.firstName = json["firstName"];
    if (json["middleName"] is String) this.middleName = json["middleName"];
    if (json["lastName"] is String) this.lastName = json["lastName"];
    if (json["suffix"] is String) this.suffix = json["suffix"];
    if (json["fullName"] is String) this.fullName = json["fullName"];
    if (json["modified"] is String) this.modified = json["modified"];
    if (json["thumbnail"] is Map) this.thumbnail = json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]);
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
    if (json["comics"] is Map) this.comics = json["comics"] == null ? null : Comics.fromJson(json["comics"]);
    if (json["series"] is Map) this.series = json["series"] == null ? null : Series.fromJson(json["series"]);
    if (json["stories"] is Map) this.stories = json["stories"] == null ? null : Stories.fromJson(json["stories"]);
    if (json["events"] is Map) this.events = json["events"] == null ? null : Events.fromJson(json["events"]);
    if (json["urls"] is List)
      this.urls = json["urls"] == null ? [] : (json["urls"] as List).map((e) => Urls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["firstName"] = this.firstName;
    data["middleName"] = this.middleName;
    data["lastName"] = this.lastName;
    data["suffix"] = this.suffix;
    data["fullName"] = this.fullName;
    data["modified"] = this.modified;
    if (this.thumbnail != null) data["thumbnail"] = this.thumbnail.toJson();
    data["resourceURI"] = this.resourceUri;
    if (this.comics != null) data["comics"] = this.comics.toJson();
    if (this.series != null) data["series"] = this.series.toJson();
    if (this.stories != null) data["stories"] = this.stories.toJson();
    if (this.events != null) data["events"] = this.events.toJson();
    if (this.urls != null) data["urls"] = this.urls.map((e) => e.toJson()).toList();
    return data;
  }
}

import 'comics.dart';
import 'characters.dart';
import 'creators.dart';
import 'dates.dart';
import 'events.dart';
import 'prices.dart';
import 'series.dart';
import 'stories.dart';
import 'text_object.dart';
import 'thumbnail.dart';
import 'urls.dart';
import 'variants.dart';

class Comic {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<TextObject> textObjects;
  String resourceUri;
  List<Urls> urls;
  SerieItem series;
  List<Variants> variants;
  List<ComicItem> collections;
  List<ComicItem> collectedIssues;
  List<Dates> dates;
  List<Prices> prices;
  Thumbnail thumbnail;
  List<Thumbnail> images;
  Creators creators;
  Characters characters;
  Stories stories;
  Events events;

  Comic(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.modified,
      this.isbn,
      this.upc,
      this.diamondCode,
      this.ean,
      this.issn,
      this.format,
      this.pageCount,
      this.textObjects,
      this.resourceUri,
      this.urls,
      this.series,
      this.variants,
      this.collections,
      this.collectedIssues,
      this.dates,
      this.prices,
      this.thumbnail,
      this.images,
      this.creators,
      this.characters,
      this.stories,
      this.events});

  Comic.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["digitalId"] is int) this.digitalId = json["digitalId"];
    if (json["title"] is String) this.title = json["title"];
    if (json["issueNumber"] is int) this.issueNumber = json["issueNumber"];
    if (json["variantDescription"] is String) this.variantDescription = json["variantDescription"];
    if (json["description"] is String) this.description = json["description"];
    if (json["modified"] is String) this.modified = json["modified"];
    if (json["isbn"] is String) this.isbn = json["isbn"];
    if (json["upc"] is String) this.upc = json["upc"];
    if (json["diamondCode"] is String) this.diamondCode = json["diamondCode"];
    if (json["ean"] is String) this.ean = json["ean"];
    if (json["issn"] is String) this.issn = json["issn"];
    if (json["format"] is String) this.format = json["format"];
    if (json["pageCount"] is int) this.pageCount = json["pageCount"];
    if (json["textObjects"] is List)
      this.urls = json["textObjects"] == null ? [] : (json["textObjects"] as List).map((e) => TextObject.fromJson(e)).toList();
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
    if (json["urls"] is List)
      this.urls = json["urls"] == null ? [] : (json["urls"] as List).map((e) => Urls.fromJson(e)).toList();
    if (json["series"] is Map) this.series = json["series"] == null ? null : SerieItem.fromJson(json["series"]);
    if (json["variants"] is List)
      this.variants = json["variants"] == null ? [] : (json["variants"] as List).map((e) => Variants.fromJson(e)).toList();
    if (json["collections"] is List)
      this.collections =
          json["collections"] == null ? [] : (json["collections"] as List).map((e) => ComicItem.fromJson(e)).toList();
    if (json["collectedIssues"] is List)
      this.collectedIssues =
          json["collectedIssues"] == null ? [] : (json["collectedIssues"] as List).map((e) => ComicItem.fromJson(e)).toList();
    if (json["dates"] is List)
      this.dates = json["dates"] == null ? [] : (json["dates"] as List).map((e) => Dates.fromJson(e)).toList();
    if (json["prices"] is List)
      this.prices = json["prices"] == null ? [] : (json["prices"] as List).map((e) => Prices.fromJson(e)).toList();
    if (json["thumbnail"] is Map) this.thumbnail = json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]);
    if (json["images"] is List)
      this.prices = json["images"] == null ? [] : (json["images"] as List).map((e) => Thumbnail.fromJson(e)).toList();
    if (json["creators"] is Map) this.creators = json["creators"] == null ? null : Creators.fromJson(json["creators"]);
    if (json["characters"] is Map) this.characters = json["characters"] == null ? null : Characters.fromJson(json["characters"]);
    if (json["stories"] is Map) this.stories = json["stories"] == null ? null : Stories.fromJson(json["stories"]);
    if (json["events"] is Map) this.events = json["events"] == null ? null : Events.fromJson(json["events"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["digitalId"] = this.digitalId;
    data["title"] = this.title;
    data["issueNumber"] = this.issueNumber;
    data["variantDescription"] = this.variantDescription;
    data["description"] = this.description;
    data["modified"] = this.modified;
    data["isbn"] = this.isbn;
    data["upc"] = this.upc;
    data["diamondCode"] = this.diamondCode;
    data["ean"] = this.ean;
    data["issn"] = this.issn;
    data["format"] = this.format;
    data["pageCount"] = this.pageCount;
    if (this.textObjects != null) data["textObjects"] = this.textObjects;
    data["resourceURI"] = this.resourceUri;
    if (this.urls != null) data["urls"] = this.urls.map((e) => e.toJson()).toList();
    if (this.series != null) data["series"] = this.series.toJson();
    if (this.variants != null) data["variants"] = this.variants.map((e) => e.toJson()).toList();
    if (this.collections != null) data["collections"] = this.collections;
    if (this.collectedIssues != null) data["collectedIssues"] = this.collectedIssues;
    if (this.dates != null) data["dates"] = this.dates.map((e) => e.toJson()).toList();
    if (this.prices != null) data["prices"] = this.prices.map((e) => e.toJson()).toList();
    if (this.thumbnail != null) data["thumbnail"] = this.thumbnail.toJson();
    if (this.images != null) data["images"] = this.images;
    if (this.creators != null) data["creators"] = this.creators.toJson();
    if (this.characters != null) data["characters"] = this.characters.toJson();
    if (this.stories != null) data["stories"] = this.stories.toJson();
    if (this.events != null) data["events"] = this.events.toJson();
    return data;
  }
}

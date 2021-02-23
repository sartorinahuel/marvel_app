import 'story.dart';

class StoriesResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  StoriesResponse({this.code, this.status, this.copyright, this.attributionText, this.attributionHtml, this.etag, this.data});

  StoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) this.code = json["code"];
    if (json["status"] is String) this.status = json["status"];
    if (json["copyright"] is String) this.copyright = json["copyright"];
    if (json["attributionText"] is String) this.attributionText = json["attributionText"];
    if (json["attributionHTML"] is String) this.attributionHtml = json["attributionHTML"];
    if (json["etag"] is String) this.etag = json["etag"];
    if (json["data"] is Map) this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["status"] = this.status;
    data["copyright"] = this.copyright;
    data["attributionText"] = this.attributionText;
    data["attributionHTML"] = this.attributionHtml;
    data["etag"] = this.etag;
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Story> results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["offset"] is int) this.offset = json["offset"];
    if (json["limit"] is int) this.limit = json["limit"];
    if (json["total"] is int) this.total = json["total"];
    if (json["count"] is int) this.count = json["count"];
    if (json["results"] is List)
      this.results = json["results"] == null ? [] : (json["results"] as List).map((e) => Story.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["offset"] = this.offset;
    data["limit"] = this.limit;
    data["total"] = this.total;
    data["count"] = this.count;
    if (this.results != null) data["results"] = this.results.map((e) => e.toJson()).toList();
    return data;
  }
}

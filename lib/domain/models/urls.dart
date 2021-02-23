class Urls {
  String type;
  String url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["url"] is String) this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["url"] = this.url;
    return data;
  }
}

class Creators {
  int available;
  String collectionUri;
  List<CreatorItem> items;
  int returned;

  Creators({this.available, this.collectionUri, this.items, this.returned});

  Creators.fromJson(Map<String, dynamic> json) {
    if (json["available"] is int) this.available = json["available"];
    if (json["collectionURI"] is String) this.collectionUri = json["collectionURI"];
    if (json["items"] is List)
      this.items = json["items"] == null ? [] : (json["items"] as List).map((e) => CreatorItem.fromJson(e)).toList();
    if (json["returned"] is int) this.returned = json["returned"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["available"] = this.available;
    data["collectionURI"] = this.collectionUri;
    if (this.items != null) data["items"] = this.items.map((e) => e.toJson()).toList();
    data["returned"] = this.returned;
    return data;
  }
}

class CreatorItem {
  String resourceUri;
  String name;
  String role;

  CreatorItem({this.resourceUri, this.name, this.role});

  CreatorItem.fromJson(Map<String, dynamic> json) {
    if (json["resourceURI"] is String) {
      String s = json["resourceURI"];
      var d = s.split('/');
      this.resourceUri = d.last;
    }
    if (json["name"] is String) this.name = json["name"];
    if (json["role"] is String) this.role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["resourceURI"] = this.resourceUri;
    data["name"] = this.name;
    data["role"] = this.role;
    return data;
  }
}

class Creators {
  int available;
  String collectionUri;
  List<Creator> items;
  int returned;

  Creators({this.available, this.collectionUri, this.items, this.returned});

  Creators.fromJson(Map<String, dynamic> json) {
    if (json["available"] is int) this.available = json["available"];
    if (json["collectionURI"] is String) this.collectionUri = json["collectionURI"];
    if (json["items"] is List)
      this.items = json["items"] == null ? [] : (json["items"] as List).map((e) => Creator.fromJson(e)).toList();
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

class Creator {
  String resourceUri;
  String name;
  String role;

  Creator({this.resourceUri, this.name, this.role});

  Creator.fromJson(Map<String, dynamic> json) {
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
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

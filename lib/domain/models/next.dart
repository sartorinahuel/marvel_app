class Next {
  String resourceUri;
  String name;

  Next({this.resourceUri, this.name});

  Next.fromJson(Map<String, dynamic> json) {
    if (json["resourceURI"] is String) this.resourceUri = json["resourceURI"];
    if (json["name"] is String) this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["resourceURI"] = this.resourceUri;
    data["name"] = this.name;
    return data;
  }
}

class Thumbnail {
  String path;
  String fileExtension;

  Thumbnail({this.path, this.fileExtension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    if (json["path"] is String) this.path = json["path"];
    if (json["extension"] is String) this.fileExtension = json["extension"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["path"] = this.path;
    data["extension"] = this.fileExtension;
    return data;
  }
}

class TextObject {
  String type;
  String language;
  String text;

  TextObject({this.type, this.language, this.text});

  TextObject.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["language"] is String) this.language = json["language"];
    if (json["text"] is String) this.text = json["text"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["language"] = this.language;
    data["text"] = this.text;
    return data;
  }
}

import 'character.dart';

class Characters {
  int available;
  String collectionUri;
  List<Character> items;
  int returned;

  Characters({this.available, this.collectionUri, this.items, this.returned});

  Characters.fromJson(Map<String, dynamic> json) {
    if (json["available"] is int) this.available = json["available"];
    if (json["collectionURI"] is String) {
      String s = json["collectionURI"];
      var d = s.split('/');
      this.collectionUri = d.last;
    }
    if (json["items"] is List)
      this.items = json["items"] == null ? [] : (json["items"] as List).map((e) => Character.fromJson(e)).toList();
    if (json["returned"] is int) this.returned = json["returned"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["available"] = this.available;
    data["collectionURI"] = this.collectionUri;
    if (this.items != null) data["items"] = this.items;
    data["returned"] = this.returned;
    return data;
  }
}

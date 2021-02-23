class Dates {
  String type;
  String date;

  Dates({this.type, this.date});

  Dates.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["date"] is String) this.date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["date"] = this.date;
    return data;
  }
}

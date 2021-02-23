class Prices {
  String type;
  int price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["price"] is int) this.price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["price"] = this.price;
    return data;
  }
}

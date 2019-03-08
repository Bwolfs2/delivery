import 'package:uuid/uuid.dart';

class Condiment {
  String id;
  final String name;
  final int quantity;

  Condiment({this.name, this.quantity, String id}) {
    this.id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["quantity"] = quantity;

    return map;
  }

  factory Condiment.fromJson(Map<dynamic, dynamic> json) =>
      Condiment(id: json['id'], name: json['name'], quantity: json["quantity"]);
}

import 'package:uuid/uuid.dart';

class CondimentModel {
  String id;
  final String name;
  final int quantity;

  CondimentModel({this.name, this.quantity, String id}) {
    this.id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["quantity"] = quantity;

    return map;
  }

  factory CondimentModel.fromJson(Map<dynamic, dynamic> json) =>
      CondimentModel(id: json['id'], name: json['name'], quantity: json["quantity"]);
}

import 'package:uuid/uuid.dart';

class Produto {
  String id;
  final String name;
  final String description;
  final double price;
  final String categoriaId;

  Produto(
      {this.id, this.name, this.description, this.price, this.categoriaId}) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["price"] = price;
    map["categoria_id"] = categoriaId;
    return map;
  }

  static fromJson(Map<String, dynamic> json) => Produto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      categoriaId: json["categoria_id"],
      price: json['price']);
}

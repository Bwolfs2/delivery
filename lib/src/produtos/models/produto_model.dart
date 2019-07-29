import 'package:uuid/uuid.dart';
import 'condiment_model.dart';

class ProdutoModel {
  String id;
  final String name;
  final String description;
  final double price;
  final String categoriaId;
  final List<CondimentModel> condiments;

  ProdutoModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoriaId,
      this.condiments}) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["price"] = price;
    map["categoria_id"] = categoriaId;
    map["condiments"] = condiments.map((item) => item.toJson()).toList();
    return map;
  }

  static fromJson(Map<String, dynamic> json) => ProdutoModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      categoriaId: json["categoria_id"],
      condiments: json["condiments"]
          ?.map<CondimentModel>((item) => CondimentModel.fromJson(item))
          ?.toList(),
      price: json['price']);
}

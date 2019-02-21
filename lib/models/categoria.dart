import 'package:delivery_flutter_app/models/produto.dart';
import 'package:uuid/uuid.dart';

class Categoria {
  String id;
  final String name;
  List<Produto> produtos;

  Categoria({this.id, this.name, this.produtos}) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();
    map["id"] = id;
    map["nome"] = name;
    return map;
  }

  static fromJson(Map<String, dynamic> json) =>
      Categoria(id: json['id'], name: json['nome']);
}

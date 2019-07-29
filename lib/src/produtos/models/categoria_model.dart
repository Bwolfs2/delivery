import 'package:uuid/uuid.dart';
import 'produto_model.dart';

class CategoriaModel {
  String id;
  final String name;
  List<ProdutoModel> produtos;

  CategoriaModel({this.id, this.name, this.produtos}) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toJson() {
    Map map = Map<String, dynamic>();
    map["id"] = id;
    map["nome"] = name;
    return map;
  }

  static fromJson(Map<String, dynamic> json) =>
      CategoriaModel(id: json['id'], name: json['nome']);
}

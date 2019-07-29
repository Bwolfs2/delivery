import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_flutter_app/src/produtos/models/categoria_model.dart';
import 'package:delivery_flutter_app/src/produtos/models/produto_model.dart';
import 'package:rxdart/rxdart.dart';

class ProdutoRepository extends Disposable {
 CollectionReference collection;
  CollectionReference categoriasColl;

  ProdutoRepository() {
    collection = Firestore.instance.collection("produtos");
    categoriasColl = Firestore.instance.collection("categoria");

    produtos.listen((item) {
      print(item);
    });

    categorias.listen((item) {
      print(item);
    });
  }

  Future<List<ProdutoModel>> getProdutos() async {
    try {
      var produtos = await collection.getDocuments();

      return produtos.documents
          .map((item) => ProdutoModel.fromJson(item.data))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ProdutoModel> getFirstProduto() async {
    try {
      var produtos = await collection.getDocuments();

      return ProdutoModel.fromJson(produtos.documents.first.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ProdutoModel> getProdutoById(String id) async {
    try {
      var produto = await collection.document("$id").get();

      return ProdutoModel.fromJson(produto.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> addProduto(ProdutoModel produto) async {
    try {
      collection.document("${produto.id}").setData(produto.toJson());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteProduto(String id) async {
    try {
      await collection.document("$id").delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateProduto(ProdutoModel produto) async {
    try {
      collection.document("${produto.id}").updateData(produto.toJson());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Observable<List<ProdutoModel>> get produtos =>
      Observable(collection.snapshots().map((item) => item.documents
          .map<ProdutoModel>((item) => ProdutoModel.fromJson(item.data))
          .toList()));

  Observable<List<CategoriaModel>> get categorias =>
      Observable(categoriasColl.snapshots().map((item) => item.documents
          .map<CategoriaModel>((item) => CategoriaModel.fromJson(item.data))
          .toList()));

  Observable<List<CategoriaModel>> get categoriasJoin => Observable.combineLatest2<
          List<CategoriaModel>,
          List<ProdutoModel>,
          List<CategoriaModel>>(categorias, produtos, (cat, prod) {
        List<CategoriaModel> listCategorias = cat.map<CategoriaModel>((categoria) {
          categoria.produtos = prod
              .where((produto) => produto.categoriaId == categoria.id)
              .toList();
          return categoria;
        }).toList();

        return listCategorias;
      });

  Stream<bool> algumaStream() async* {
    yield true;
  }
  @override
  void dispose() {}
}

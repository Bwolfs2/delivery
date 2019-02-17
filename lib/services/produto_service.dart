import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_flutter_app/models/produto.dart';
import 'package:rxdart/rxdart.dart';

class ProdutoService {
  CollectionReference collection;
  CollectionReference categoriasColl;

  ProdutoService() {
    collection = Firestore.instance.collection("produtos");
    categoriasColl = Firestore.instance.collection("categoria");
  }

  Future<List<Produto>> getProdutos() async {
    try {
      var produtos = await collection.getDocuments();

      return produtos.documents
          .map((item) => Produto.fromJson(item.data))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Produto> getFirstProduto() async {
    try {
      var produtos = await collection.getDocuments();

      return Produto.fromJson(produtos.documents.first.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Produto> getProdutoById(String id) async {
    try {
      var produto = await collection.document("$id").get();

      return Produto.fromJson(produto.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> addProduto(Produto produto) async {
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

  Future<bool> updateProduto(Produto produto) async {
    try {
      collection.document("${produto.id}").updateData(produto.toJson());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Observable<List<Produto>> get produtos =>
      Observable(collection.snapshots().map((item) => item.documents
          .map<Produto>((item) => Produto.fromJson(item.data))
          .toList()));

  Observable<List<Categoria>> get categorias =>
      Observable(categoriasColl.snapshots().map((item) => item.documents
          .map<Categoria>((item) => Categoria.fromJson(item.data))
          .toList()));

  Observable<List<Categoria>> get categoriasJoin => Observable.combineLatest2<
          List<Categoria>,
          List<Produto>,
          List<Categoria>>(categorias, produtos, (cat, prod) {
        List<Categoria> listCategorias = cat.map<Categoria>((categoria) {
          print(categoria.id);
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
}

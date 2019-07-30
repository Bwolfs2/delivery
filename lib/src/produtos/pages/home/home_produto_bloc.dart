import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:delivery_flutter_app/src/produtos/models/categoria_model.dart';
import 'package:delivery_flutter_app/src/produtos/models/produto_model.dart';
import 'package:delivery_flutter_app/src/produtos/repositories/produto_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeProdutoBloc extends BlocBase {
  final ProdutoRepository produtoRepository;

  HomeProdutoBloc(this.produtoRepository);

  Observable<List<CategoriaModel>> get categoriasJoin =>
      produtoRepository.categoriasJoin;

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> addProduto(ProdutoModel produtoModel) {
    return produtoRepository.addProduto(produtoModel);
  }

  Future<ProdutoModel> getProdutoById(String id) {
    return produtoRepository.getProdutoById(id);
  }
}
